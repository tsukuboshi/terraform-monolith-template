# ====================
#
# Terraform
#
# ====================

terraform {
  required_version = ">=1.0.0"

  # backend "s3" {
  #   bucket = "tsukuboshi-bucket-tf-backend"
  #   key    = "terraform.tfstate"
  #   region = "ap-northeast-1"

  #   dynamodb_table = "tsukuboshi-ddb-tf-backend"
  # }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# ====================
#
# Provider
#
# ====================

provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      Prj = var.project
      Env = var.environment
    }
  }
}

provider "aws" {
  alias  = "virginia"
  region = "us-east-1"
  default_tags {
    tags = {
      Prj = var.project
      Env = var.environment
    }
  }
}

# ====================
#
# Modules
#
# ====================

module "vpc" {
  source                              = "../../modules/vpc"
  system                              = var.system
  project                             = var.project
  environment                         = var.environment
  vpc_cidr_block                      = var.vpc_cidr_block
  has_flow_log                        = true
  flow_log_bucket_arn                 = module.s3_vpc_log_bucket.bucket_arn
  flow_log_file_format                = var.flow_log_file_format_text
  flow_log_hive_compatible_partitions = false
  flow_log_per_hour_partition         = false
}

module "s3_vpc_log_bucket" {
  source                 = "../../modules/s3logbucket"
  system                 = var.system
  project                = var.project
  environment            = var.environment
  resourcetype           = var.s3_rsrc_type_vpc
  internal               = var.internal
  object_ownership       = var.disabled_s3_acl
  object_expiration_days = var.object_expiration_days
}

module "public_1a_subnet" {
  source                         = "../../modules/subnet"
  system                         = var.system
  project                        = var.project
  environment                    = var.environment
  resourcetype                   = "${var.network_rsrc_type_public}-${var.az_short_name_1a}"
  subnet_cidr_block              = var.public_subnet_1a_cidr_block
  subnet_map_public_ip_on_launch = true
  subnet_availability_zone       = var.availability_zone_1a
  vpc_id                         = module.vpc.vpc_id
}

module "public_1c_subnet" {
  source                         = "../../modules/subnet"
  system                         = var.system
  project                        = var.project
  environment                    = var.environment
  resourcetype                   = "${var.network_rsrc_type_public}-${var.az_short_name_1c}"
  subnet_cidr_block              = var.public_subnet_1c_cidr_block
  subnet_map_public_ip_on_launch = true
  subnet_availability_zone       = var.availability_zone_1c
  vpc_id                         = module.vpc.vpc_id
}

module "private_1a_subnet" {
  source                         = "../../modules/subnet"
  system                         = var.system
  project                        = var.project
  environment                    = var.environment
  resourcetype                   = "${var.network_rsrc_type_private}-${var.az_short_name_1a}"
  subnet_cidr_block              = var.private_subnet_1a_cidr_block
  subnet_map_public_ip_on_launch = false
  subnet_availability_zone       = var.availability_zone_1a
  vpc_id                         = module.vpc.vpc_id
}

module "private_1c_subnet" {
  source                         = "../../modules/subnet"
  system                         = var.system
  project                        = var.project
  environment                    = var.environment
  resourcetype                   = "${var.network_rsrc_type_private}-${var.az_short_name_1c}"
  subnet_cidr_block              = var.private_subnet_1c_cidr_block
  subnet_map_public_ip_on_launch = false
  subnet_availability_zone       = var.availability_zone_1c
  vpc_id                         = module.vpc.vpc_id
}

module "isolated_1a_subnet" {
  source                         = "../../modules/subnet"
  system                         = var.system
  project                        = var.project
  environment                    = var.environment
  resourcetype                   = "${var.network_rsrc_type_isolated}-${var.az_short_name_1a}"
  subnet_cidr_block              = var.isolated_subnet_1a_cidr_block
  subnet_map_public_ip_on_launch = false
  subnet_availability_zone       = var.availability_zone_1a
  vpc_id                         = module.vpc.vpc_id
}

module "isolated_1c_subnet" {
  source                         = "../../modules/subnet"
  system                         = var.system
  project                        = var.project
  environment                    = var.environment
  resourcetype                   = "${var.network_rsrc_type_isolated}-${var.az_short_name_1c}"
  subnet_cidr_block              = var.isolated_subnet_1c_cidr_block
  subnet_map_public_ip_on_launch = false
  subnet_availability_zone       = var.availability_zone_1c
  vpc_id                         = module.vpc.vpc_id
}


module "public_routetable" {
  source        = "../../modules/routetable"
  system        = var.system
  project       = var.project
  environment   = var.environment
  resourcetype  = var.network_rsrc_type_public
  vpc_id        = module.vpc.vpc_id
  has_subnet_1a = true
  has_subnet_1c = true
  subnet_1a_id  = module.public_1a_subnet.subnet_id
  subnet_1c_id  = module.public_1c_subnet.subnet_id
}

module "private_1a_routetable" {
  source        = "../../modules/routetable"
  system        = var.system
  project       = var.project
  environment   = var.environment
  resourcetype  = "${var.network_rsrc_type_private}-${var.az_short_name_1a}"
  vpc_id        = module.vpc.vpc_id
  has_subnet_1a = true
  subnet_1a_id  = module.private_1a_subnet.subnet_id
}

module "private_1c_routetable" {
  source        = "../../modules/routetable"
  system        = var.system
  project       = var.project
  environment   = var.environment
  resourcetype  = "${var.network_rsrc_type_private}-${var.az_short_name_1c}"
  vpc_id        = module.vpc.vpc_id
  has_subnet_1c = true
  subnet_1c_id  = module.private_1c_subnet.subnet_id
}

module "isolated_routetable" {
  source        = "../../modules/routetable"
  system        = var.system
  project       = var.project
  environment   = var.environment
  resourcetype  = var.network_rsrc_type_isolated
  vpc_id        = module.vpc.vpc_id
  has_subnet_1a = true
  has_subnet_1c = true
  subnet_1a_id  = module.isolated_1a_subnet.subnet_id
  subnet_1c_id  = module.isolated_1c_subnet.subnet_id
}

module "internetgateway" {
  source         = "../../modules/internetgateway"
  system         = var.system
  project        = var.project
  environment    = var.environment
  vpc_id         = module.vpc.vpc_id
  route_table_id = module.public_routetable.route_table_id
}

module "public_1a_natgateway" {
  source         = "../../modules/natgateway"
  system         = var.system
  project        = var.project
  environment    = var.environment
  resourcetype   = "${var.network_rsrc_type_public}-${var.az_short_name_1a}"
  subnet_id      = module.public_1a_subnet.subnet_id
  igw_id         = module.internetgateway.internet_route_id
  route_table_id = module.private_1a_routetable.route_table_id
}

module "public_1c_natgateway" {
  source         = "../../modules/natgateway"
  system         = var.system
  project        = var.project
  environment    = var.environment
  resourcetype   = "${var.network_rsrc_type_public}-${var.az_short_name_1c}"
  subnet_id      = module.public_1c_subnet.subnet_id
  igw_id         = module.internetgateway.internet_route_id
  route_table_id = module.private_1c_routetable.route_table_id
}

module "public_networkacl" {
  source       = "../../modules/networkacl"
  system       = var.system
  project      = var.project
  environment  = var.environment
  resourcetype = var.network_rsrc_type_public
  vpc_id       = module.vpc.vpc_id
  subnet_1a_id = module.public_1a_subnet.subnet_id
  subnet_1c_id = module.public_1c_subnet.subnet_id
}

module "private_networkacl" {
  source       = "../../modules/networkacl"
  system       = var.system
  project      = var.project
  environment  = var.environment
  resourcetype = var.network_rsrc_type_private
  vpc_id       = module.vpc.vpc_id
  subnet_1a_id = module.private_1a_subnet.subnet_id
  subnet_1c_id = module.private_1c_subnet.subnet_id
}

module "isolated_networkacl" {
  source       = "../../modules/networkacl"
  system       = var.system
  project      = var.project
  environment  = var.environment
  resourcetype = var.network_rsrc_type_isolated
  vpc_id       = module.vpc.vpc_id
  subnet_1a_id = module.isolated_1a_subnet.subnet_id
  subnet_1c_id = module.isolated_1c_subnet.subnet_id
}

module "alb_sg" {
  source       = "../../modules/securitygroup"
  system       = var.system
  project      = var.project
  environment  = var.environment
  resourcetype = var.service_rsrc_type_alb
  vpc_id       = module.vpc.vpc_id
}

module "ec2_sg" {
  source       = "../../modules/securitygroup"
  system       = var.system
  project      = var.project
  environment  = var.environment
  resourcetype = var.service_rsrc_type_ec2
  vpc_id       = module.vpc.vpc_id
}

module "rds_sg" {
  source       = "../../modules/securitygroup"
  system       = var.system
  project      = var.project
  environment  = var.environment
  resourcetype = var.service_rsrc_type_rds
  vpc_id       = module.vpc.vpc_id
}

module "alb_sg_ingress_rule_http" {
  source              = "../../modules/securitygrouprule"
  system              = var.system
  project             = var.project
  environment         = var.environment
  security_group_id   = module.alb_sg.security_group_id
  sg_rule_type        = "ingress"
  sg_rule_protocol    = "tcp"
  sg_rule_from_port   = 80
  sg_rule_to_port     = 80
  sg_rule_cidr_blocks = ["0.0.0.0/0"]
}

module "alb_sg_ingress_rule_https" {
  source              = "../../modules/securitygrouprule"
  system              = var.system
  project             = var.project
  environment         = var.environment
  security_group_id   = module.alb_sg.security_group_id
  sg_rule_type        = "ingress"
  sg_rule_protocol    = "tcp"
  sg_rule_from_port   = 443
  sg_rule_to_port     = 443
  sg_rule_cidr_blocks = ["0.0.0.0/0"]
}

module "alb_sg_egress_rule_all" {
  source              = "../../modules/securitygrouprule"
  system              = var.system
  project             = var.project
  environment         = var.environment
  security_group_id   = module.alb_sg.security_group_id
  sg_rule_type        = "egress"
  sg_rule_protocol    = -1
  sg_rule_from_port   = 0
  sg_rule_to_port     = 0
  sg_rule_cidr_blocks = ["0.0.0.0/0"]
}

module "ec2_sg_ingress_rule_http" {
  source                           = "../../modules/securitygrouprule"
  system                           = var.system
  project                          = var.project
  environment                      = var.environment
  security_group_id                = module.ec2_sg.security_group_id
  sg_rule_type                     = "ingress"
  sg_rule_protocol                 = "tcp"
  sg_rule_from_port                = 80
  sg_rule_to_port                  = 80
  sg_rule_source_security_group_id = module.alb_sg.security_group_id
}

# module "ec2_sg_ingress_rule_ssh" {
#   source                           = "../../modules/securitygrouprule"
#   system                           = var.system
#   project                          = var.project
#   environment                      = var.environment
#   security_group_id                = module.ec2_sg.security_group_id
#   sg_rule_type                     = "ingress"
#   sg_rule_protocol                 = "tcp"
#   sg_rule_from_port                = 22
#   sg_rule_to_port                  = 22
#   sg_rule_cidr_blocks              = ["xxx.xxx.xxx.xxx"]
# }

module "rds_sg_ingress_rule_mysql" {
  source                           = "../../modules/securitygrouprule"
  system                           = var.system
  project                          = var.project
  environment                      = var.environment
  security_group_id                = module.rds_sg.security_group_id
  sg_rule_type                     = "ingress"
  sg_rule_protocol                 = "tcp"
  sg_rule_from_port                = 3306
  sg_rule_to_port                  = 3306
  sg_rule_source_security_group_id = module.ec2_sg.security_group_id
}

module "rds_sg_egress_rule_all" {
  source              = "../../modules/securitygrouprule"
  system              = var.system
  project             = var.project
  environment         = var.environment
  security_group_id   = module.rds_sg.security_group_id
  sg_rule_type        = "egress"
  sg_rule_protocol    = -1
  sg_rule_from_port   = 0
  sg_rule_to_port     = 0
  sg_rule_cidr_blocks = ["0.0.0.0/0"]
}

module "route53_record" {
  source              = "../../modules/route53record"
  route53_zone_name   = var.naked_domain
  route53_record_name = "${var.sub_domain}.${var.naked_domain}"
  alb_dns_name        = module.alb.alb_dns_name
  alb_zone_id         = module.alb.alb_zone_id
}

module "acm" {
  source            = "../../modules/acm"
  system            = var.system
  project           = var.project
  environment       = var.environment
  route53_zone_name = var.naked_domain
  acm_domain_name   = var.naked_domain
  acm_sans          = "*.${var.naked_domain}"
}

module "alb" {
  source                 = "../../modules/alb"
  system                 = var.system
  project                = var.project
  environment            = var.environment
  internal               = var.internal
  security_group_id      = module.alb_sg.security_group_id
  subnet_1a_id           = module.public_1a_subnet.subnet_id
  subnet_1c_id           = module.public_1c_subnet.subnet_id
  has_access_logs        = true
  access_log_bucket_name = module.s3_alb_log_bucket.bucket_name
  access_log_prefix      = var.access_log_prefix
}

module "alb_http_listener" {
  source            = "../../modules/albhttplistener"
  system            = var.system
  project           = var.project
  environment       = var.environment
  resourcetype      = "default"
  http_port         = 80
  redirect_port     = 443
  load_balancer_arn = module.alb.alb_arn
}

module "alb_https_listener" {
  source                = "../../modules/albhttpslistener"
  system                = var.system
  project               = var.project
  environment           = var.environment
  resourcetype          = "default"
  https_port            = 443
  load_balancer_arn     = module.alb.alb_arn
  acm_alb_cert_arn      = module.acm.acm_alb_cert_arn
  acm_alb_cert_valid_id = module.acm.acm_alb_cert_valid_id
}

module "alb_tg" {
  source                    = "../../modules/albtargetgroup"
  system                    = var.system
  project                   = var.project
  environment               = var.environment
  resourcetype              = "default"
  vpc_id                    = module.vpc.vpc_id
  alb_target_type           = var.alb_target_type_ec2
  alb_lsnr_https_arn        = module.alb_https_listener.listener_arn
  alb_lsnr_rule_priority    = 100
  has_host_header           = true
  alb_lsnr_rule_host_header = "${var.sub_domain}.${var.naked_domain}"
}

module "s3_alb_log_bucket" {
  source                 = "../../modules/s3logbucket"
  system                 = var.system
  project                = var.project
  environment            = var.environment
  resourcetype           = var.s3_rsrc_type_alb
  internal               = var.internal
  object_ownership       = var.disabled_s3_acl
  object_expiration_days = var.object_expiration_days
}

module "s3_alb_log_bucket_policy" {
  source                 = "../../modules/s3logbucketpolicy"
  access_log_bucket_name = module.s3_alb_log_bucket.bucket_name
  access_log_bucket_id   = module.s3_alb_log_bucket.bucket_id
  access_log_prefix      = var.access_log_prefix
}

module "waf" {
  source                         = "../../modules/waf"
  system                         = var.system
  project                        = var.project
  environment                    = var.environment
  resourcetype                   = var.waf_rsrc_type_alb
  waf_block_mode                 = true
  waf_cloudwatch_metrics_enabled = true
  waf_sampled_requests_enabled   = true
  alb_arn                        = module.alb.alb_arn
  has_web_acl_log                = true
  waf_log_bucket_arn             = module.s3_waf_log_bucket.bucket_arn
}

module "s3_waf_log_bucket" {
  source                 = "../../modules/s3logbucket"
  system                 = var.system
  project                = var.project
  environment            = var.environment
  resourcetype           = var.s3_rsrc_type_waf
  internal               = var.internal
  object_ownership       = var.disabled_s3_acl
  object_expiration_days = var.object_expiration_days
}


# module "keypair" {
#   source       = "../../modules/keypair"
#   system       = var.system
#   project      = var.project
#   environment  = var.environment
#   has_key_pair = true
#   public_key_file = ~/.ssh/xxx.pub
# }

module "ami" {
  source = "../../modules/ami"
}

module "iam_ec2_policy" {
  source              = "../../modules/iammanagedpolicy"
  iam_role_policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

module "iam_ec2_role" {
  source                         = "../../modules/iamrole"
  system                         = var.system
  project                        = var.project
  environment                    = var.environment
  resourcetype                   = var.service_rsrc_type_ec2
  iam_role_principal_identifiers = "ec2.amazonaws.com"
  iam_policy_arn                 = module.iam_ec2_policy.iam_policy_arn
}

module "instance_profile" {
  source        = "../../modules/instanceprofile"
  system        = var.system
  project       = var.project
  environment   = var.environment
  resourcetype  = var.service_rsrc_type_ec2
  ec2_role_name = module.iam_ec2_role.iam_role_name
}

module "ec2_1a_instance" {
  source                      = "../../modules/ec2"
  system                      = var.system
  project                     = var.project
  environment                 = var.environment
  resourcetype                = "${var.instance_rsrc_type_web}-${var.az_short_name_1a}"
  internal                    = var.internal
  instance_type               = var.instance_type
  subnet_id                   = module.private_1a_subnet.subnet_id
  security_group_id           = module.ec2_sg.security_group_id
  ami_image_id                = module.ami.ami_image_id
  associate_public_ip_address = var.has_public_ip_to_computer
  instance_profile            = module.instance_profile.instance_profile
  # key_pair_id                 = module.keypair.key_pair_id
  user_data_file    = var.user_data_file
  ebs_volume_size   = var.ebs_volume_size
  ebs_volume_type   = var.ebs_volume_type
  ebs_encrypted     = var.ebs_encrypted
  outbound_route_id = module.public_1a_natgateway.internet_route_id
}

module "alb_tgec2_1a" {
  source           = "../../modules/albtargetgroupattach"
  target_group_arn = module.alb_tg.alb_tg_arn
  instance_id      = module.ec2_1a_instance.instance_id
}

module "ec2_1c_instance" {
  source                      = "../../modules/ec2"
  system                      = var.system
  project                     = var.project
  environment                 = var.environment
  resourcetype                = "${var.instance_rsrc_type_web}-${var.az_short_name_1c}"
  internal                    = var.internal
  instance_type               = var.instance_type
  subnet_id                   = module.private_1c_subnet.subnet_id
  security_group_id           = module.ec2_sg.security_group_id
  ami_image_id                = module.ami.ami_image_id
  associate_public_ip_address = var.has_public_ip_to_computer
  instance_profile            = module.instance_profile.instance_profile
  # key_pair_id                 = module.keypair.key_pair_id
  user_data_file    = var.user_data_file
  ebs_volume_size   = var.ebs_volume_size
  ebs_volume_type   = var.ebs_volume_type
  ebs_encrypted     = var.ebs_encrypted
  outbound_route_id = module.public_1c_natgateway.internet_route_id
}

module "alb_tgec2_1c" {
  source           = "../../modules/albtargetgroupattach"
  target_group_arn = module.alb_tg.alb_tg_arn
  instance_id      = module.ec2_1c_instance.instance_id
}

module "iam_backup_policy" {
  source              = "../../modules/iammanagedpolicy"
  iam_role_policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup"
}

module "iam_backup_role" {
  source                         = "../../modules/iamrole"
  system                         = var.system
  project                        = var.project
  environment                    = var.environment
  resourcetype                   = var.service_rsrc_type_backup
  iam_role_principal_identifiers = "backup.amazonaws.com"
  iam_policy_arn                 = module.iam_backup_policy.iam_policy_arn
}

module "ec2_backup" {
  source          = "../../modules/ec2backup"
  system          = var.system
  project         = var.project
  environment     = var.environment
  backup_role_arn = module.iam_backup_role.iam_role_arn
  instance_1a_arn = module.ec2_1a_instance.instance_arn
  instance_1c_arn = module.ec2_1c_instance.instance_arn
}

module "iam_rds_policy" {
  source              = "../../modules/iammanagedpolicy"
  iam_role_policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
}

module "iam_rds_role" {
  source                         = "../../modules/iamrole"
  system                         = var.system
  project                        = var.project
  environment                    = var.environment
  resourcetype                   = var.service_rsrc_type_rds
  iam_role_principal_identifiers = "monitoring.rds.amazonaws.com"
  iam_policy_arn                 = module.iam_rds_policy.iam_policy_arn
}

module "rds" {
  source             = "../../modules/rds"
  system             = var.system
  project            = var.project
  environment        = var.environment
  internal           = var.internal
  rds_engine_version = var.rds_engine_version
  security_group_id  = module.rds_sg.security_group_id
  db_instance_class  = var.db_instance_class
  # db_name                     = "${var.system}${var.project}${var.environment}db"
  db_root_name             = var.db_root_name
  db_root_pass             = var.db_root_pass
  db_storage_type          = var.db_storage_type
  db_allocated_storage     = var.db_allocated_storage
  db_max_allocated_storage = var.db_max_allocated_storage
  db_storage_encrypted     = var.db_storage_encrypted
  # db_enabled_cloudwatch_logs_exports = ["error", "slowquery", "audit", "general"]
  db_backup_retention_period               = var.db_backup_retention_period
  db_backup_window                         = var.db_backup_window
  db_maintenance_window                    = var.db_maintenance_window
  db_performance_insights_enabled          = var.db_performance_insights_enabled
  db_performance_insights_retention_period = var.db_performance_insights_retention_period
  db_monitoring_role_arn                   = module.iam_rds_role.iam_role_arn
  db_monitoring_interval                   = var.db_monitoring_interval
  db_auto_minor_version_upgrade            = var.db_auto_minor_version_upgrade
  isolated_1a_subnet_id                    = module.isolated_1a_subnet.subnet_id
  isolated_1c_subnet_id                    = module.isolated_1c_subnet.subnet_id
}
