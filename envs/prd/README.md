<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.10.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_account"></a> [account](#module\_account) | ../../modules/account | n/a |
| <a name="module_acm_self_signed"></a> [acm\_self\_signed](#module\_acm\_self\_signed) | ../../modules/acmselfsigned | n/a |
| <a name="module_alb"></a> [alb](#module\_alb) | ../../modules/alb | n/a |
| <a name="module_alb_http_listener"></a> [alb\_http\_listener](#module\_alb\_http\_listener) | ../../modules/albhttplistener | n/a |
| <a name="module_alb_https_listener"></a> [alb\_https\_listener](#module\_alb\_https\_listener) | ../../modules/albhttpslistener | n/a |
| <a name="module_alb_sg"></a> [alb\_sg](#module\_alb\_sg) | ../../modules/securitygroup | n/a |
| <a name="module_alb_sg_egress_rule_all"></a> [alb\_sg\_egress\_rule\_all](#module\_alb\_sg\_egress\_rule\_all) | ../../modules/securitygrouprule | n/a |
| <a name="module_alb_sg_ingress_rule_http"></a> [alb\_sg\_ingress\_rule\_http](#module\_alb\_sg\_ingress\_rule\_http) | ../../modules/securitygrouprule | n/a |
| <a name="module_alb_sg_ingress_rule_https"></a> [alb\_sg\_ingress\_rule\_https](#module\_alb\_sg\_ingress\_rule\_https) | ../../modules/securitygrouprule | n/a |
| <a name="module_alb_tg"></a> [alb\_tg](#module\_alb\_tg) | ../../modules/albtargetgroup | n/a |
| <a name="module_alb_tgec2_1a"></a> [alb\_tgec2\_1a](#module\_alb\_tgec2\_1a) | ../../modules/albtargetgroupattach | n/a |
| <a name="module_alb_tgec2_1c"></a> [alb\_tgec2\_1c](#module\_alb\_tgec2\_1c) | ../../modules/albtargetgroupattach | n/a |
| <a name="module_ami"></a> [ami](#module\_ami) | ../../modules/ami | n/a |
| <a name="module_backup_common"></a> [backup\_common](#module\_backup\_common) | ../../modules/backupcommon | n/a |
| <a name="module_backup_ec2"></a> [backup\_ec2](#module\_backup\_ec2) | ../../modules/backupec2 | n/a |
| <a name="module_backup_rds"></a> [backup\_rds](#module\_backup\_rds) | ../../modules/backuprds | n/a |
| <a name="module_ec2_1a_instance"></a> [ec2\_1a\_instance](#module\_ec2\_1a\_instance) | ../../modules/ec2 | n/a |
| <a name="module_ec2_1c_instance"></a> [ec2\_1c\_instance](#module\_ec2\_1c\_instance) | ../../modules/ec2 | n/a |
| <a name="module_ec2_sg"></a> [ec2\_sg](#module\_ec2\_sg) | ../../modules/securitygroup | n/a |
| <a name="module_ec2_sg_egress_rule_all"></a> [ec2\_sg\_egress\_rule\_all](#module\_ec2\_sg\_egress\_rule\_all) | ../../modules/securitygrouprule | n/a |
| <a name="module_ec2_sg_ingress_rule_http"></a> [ec2\_sg\_ingress\_rule\_http](#module\_ec2\_sg\_ingress\_rule\_http) | ../../modules/securitygrouprule | n/a |
| <a name="module_iam_backup_backup_policy"></a> [iam\_backup\_backup\_policy](#module\_iam\_backup\_backup\_policy) | ../../modules/iamservierolepolicy | n/a |
| <a name="module_iam_backup_backup_policy_attach"></a> [iam\_backup\_backup\_policy\_attach](#module\_iam\_backup\_backup\_policy\_attach) | ../../modules/iamrolepolicyattach | n/a |
| <a name="module_iam_backup_passrole_policy"></a> [iam\_backup\_passrole\_policy](#module\_iam\_backup\_passrole\_policy) | ../../modules/iampolicy | n/a |
| <a name="module_iam_backup_restores_policy"></a> [iam\_backup\_restores\_policy](#module\_iam\_backup\_restores\_policy) | ../../modules/iamservierolepolicy | n/a |
| <a name="module_iam_backup_restores_policy_attach"></a> [iam\_backup\_restores\_policy\_attach](#module\_iam\_backup\_restores\_policy\_attach) | ../../modules/iamrolepolicyattach | n/a |
| <a name="module_iam_backup_role"></a> [iam\_backup\_role](#module\_iam\_backup\_role) | ../../modules/iamrole | n/a |
| <a name="module_iam_ec2_role"></a> [iam\_ec2\_role](#module\_iam\_ec2\_role) | ../../modules/iamrole | n/a |
| <a name="module_iam_ec2_role_s3_policy_attach"></a> [iam\_ec2\_role\_s3\_policy\_attach](#module\_iam\_ec2\_role\_s3\_policy\_attach) | ../../modules/iamrolepolicyattach | n/a |
| <a name="module_iam_ec2_role_secret_policy_attach"></a> [iam\_ec2\_role\_secret\_policy\_attach](#module\_iam\_ec2\_role\_secret\_policy\_attach) | ../../modules/iamrolepolicyattach | n/a |
| <a name="module_iam_ec2_role_ssm_policy_attach"></a> [iam\_ec2\_role\_ssm\_policy\_attach](#module\_iam\_ec2\_role\_ssm\_policy\_attach) | ../../modules/iamrolepolicyattach | n/a |
| <a name="module_iam_ec2_s3_policy"></a> [iam\_ec2\_s3\_policy](#module\_iam\_ec2\_s3\_policy) | ../../modules/iampolicy | n/a |
| <a name="module_iam_ec2_secret_policy"></a> [iam\_ec2\_secret\_policy](#module\_iam\_ec2\_secret\_policy) | ../../modules/iampolicy | n/a |
| <a name="module_iam_ec2_ssm_policy"></a> [iam\_ec2\_ssm\_policy](#module\_iam\_ec2\_ssm\_policy) | ../../modules/iamservierolepolicy | n/a |
| <a name="module_iam_rds_policy"></a> [iam\_rds\_policy](#module\_iam\_rds\_policy) | ../../modules/iamservierolepolicy | n/a |
| <a name="module_iam_rds_role"></a> [iam\_rds\_role](#module\_iam\_rds\_role) | ../../modules/iamrole | n/a |
| <a name="module_iam_rds_role_policy_attach"></a> [iam\_rds\_role\_policy\_attach](#module\_iam\_rds\_role\_policy\_attach) | ../../modules/iamrolepolicyattach | n/a |
| <a name="module_instance_profile"></a> [instance\_profile](#module\_instance\_profile) | ../../modules/instanceprofile | n/a |
| <a name="module_internetgateway"></a> [internetgateway](#module\_internetgateway) | ../../modules/internetgateway | n/a |
| <a name="module_isolated_1a_subnet"></a> [isolated\_1a\_subnet](#module\_isolated\_1a\_subnet) | ../../modules/subnet | n/a |
| <a name="module_isolated_1c_subnet"></a> [isolated\_1c\_subnet](#module\_isolated\_1c\_subnet) | ../../modules/subnet | n/a |
| <a name="module_isolated_networkacl"></a> [isolated\_networkacl](#module\_isolated\_networkacl) | ../../modules/networkacl | n/a |
| <a name="module_isolated_routetable"></a> [isolated\_routetable](#module\_isolated\_routetable) | ../../modules/routetable | n/a |
| <a name="module_private_1a_routetable"></a> [private\_1a\_routetable](#module\_private\_1a\_routetable) | ../../modules/routetable | n/a |
| <a name="module_private_1a_subnet"></a> [private\_1a\_subnet](#module\_private\_1a\_subnet) | ../../modules/subnet | n/a |
| <a name="module_private_1c_routetable"></a> [private\_1c\_routetable](#module\_private\_1c\_routetable) | ../../modules/routetable | n/a |
| <a name="module_private_1c_subnet"></a> [private\_1c\_subnet](#module\_private\_1c\_subnet) | ../../modules/subnet | n/a |
| <a name="module_private_networkacl"></a> [private\_networkacl](#module\_private\_networkacl) | ../../modules/networkacl | n/a |
| <a name="module_public_1a_natgateway"></a> [public\_1a\_natgateway](#module\_public\_1a\_natgateway) | ../../modules/natgateway | n/a |
| <a name="module_public_1a_subnet"></a> [public\_1a\_subnet](#module\_public\_1a\_subnet) | ../../modules/subnet | n/a |
| <a name="module_public_1c_natgateway"></a> [public\_1c\_natgateway](#module\_public\_1c\_natgateway) | ../../modules/natgateway | n/a |
| <a name="module_public_1c_subnet"></a> [public\_1c\_subnet](#module\_public\_1c\_subnet) | ../../modules/subnet | n/a |
| <a name="module_public_networkacl"></a> [public\_networkacl](#module\_public\_networkacl) | ../../modules/networkacl | n/a |
| <a name="module_public_routetable"></a> [public\_routetable](#module\_public\_routetable) | ../../modules/routetable | n/a |
| <a name="module_rds"></a> [rds](#module\_rds) | ../../modules/rds | n/a |
| <a name="module_rds_sg"></a> [rds\_sg](#module\_rds\_sg) | ../../modules/securitygroup | n/a |
| <a name="module_rds_sg_egress_rule_all"></a> [rds\_sg\_egress\_rule\_all](#module\_rds\_sg\_egress\_rule\_all) | ../../modules/securitygrouprule | n/a |
| <a name="module_rds_sg_ingress_rule_rds"></a> [rds\_sg\_ingress\_rule\_rds](#module\_rds\_sg\_ingress\_rule\_rds) | ../../modules/securitygrouprule | n/a |
| <a name="module_s3_alb_log_bucket"></a> [s3\_alb\_log\_bucket](#module\_s3\_alb\_log\_bucket) | ../../modules/s3logbucket | n/a |
| <a name="module_s3_alb_log_bucket_policy"></a> [s3\_alb\_log\_bucket\_policy](#module\_s3\_alb\_log\_bucket\_policy) | ../../modules/s3logbucketpolicy | n/a |
| <a name="module_s3_vpc_log_bucket"></a> [s3\_vpc\_log\_bucket](#module\_s3\_vpc\_log\_bucket) | ../../modules/s3logbucket | n/a |
| <a name="module_s3_waf_log_bucket"></a> [s3\_waf\_log\_bucket](#module\_s3\_waf\_log\_bucket) | ../../modules/s3logbucket | n/a |
| <a name="module_ssm_patch_manager"></a> [ssm\_patch\_manager](#module\_ssm\_patch\_manager) | ../../modules/ssmpatchmanager | n/a |
| <a name="module_ssm_session_log_bucket"></a> [ssm\_session\_log\_bucket](#module\_ssm\_session\_log\_bucket) | ../../modules/s3logbucket | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ../../modules/vpc | n/a |
| <a name="module_waf"></a> [waf](#module\_waf) | ../../modules/waf | n/a |
| <a name="module_wafassociation"></a> [wafassociation](#module\_wafassociation) | ../../modules/wafassociation | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_region.region](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_log_prefix"></a> [access\_log\_prefix](#input\_access\_log\_prefix) | ALBアクセスログのプレフィックス | `string` | `"alb"` | no |
| <a name="input_alb_target_type_ec2"></a> [alb\_target\_type\_ec2](#input\_alb\_target\_type\_ec2) | ALBターゲットタイプ（EC2インスタンス用） | `string` | `"instance"` | no |
| <a name="input_alb_tg_rsrc_type_enduser"></a> [alb\_tg\_rsrc\_type\_enduser](#input\_alb\_tg\_rsrc\_type\_enduser) | ALBターゲットグループリソースタイプ（エンドユーザー用） | `string` | `"enduser"` | no |
| <a name="input_ami_id"></a> [ami\_id](#input\_ami\_id) | 使用するAMIのID | `string` | `"ami-02e5504ea463e3f34"` | no |
| <a name="input_availability_zone_1a"></a> [availability\_zone\_1a](#input\_availability\_zone\_1a) | 使用するアベイラビリティゾーン1a | `string` | `"ap-northeast-1a"` | no |
| <a name="input_availability_zone_1c"></a> [availability\_zone\_1c](#input\_availability\_zone\_1c) | 使用するアベイラビリティゾーン1c | `string` | `"ap-northeast-1c"` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWSのリージョン。デフォルトは東京リージョン | `string` | `"ap-northeast-1"` | no |
| <a name="input_az_short_name_1a"></a> [az\_short\_name\_1a](#input\_az\_short\_name\_1a) | アベイラビリティゾーン1aの短縮名 | `string` | `"1a"` | no |
| <a name="input_az_short_name_1c"></a> [az\_short\_name\_1c](#input\_az\_short\_name\_1c) | アベイラビリティゾーン1cの短縮名 | `string` | `"1c"` | no |
| <a name="input_backup_delete_after_days"></a> [backup\_delete\_after\_days](#input\_backup\_delete\_after\_days) | バックアップの保持期間（日数） | `number` | `7` | no |
| <a name="input_backup_schedule_expression"></a> [backup\_schedule\_expression](#input\_backup\_schedule\_expression) | バックアップのスケジュール式（cron形式） | `string` | `"cron(0 16 * * ? *)"` | no |
| <a name="input_backup_tag_key"></a> [backup\_tag\_key](#input\_backup\_tag\_key) | バックアップ対象を識別するためのタグキー | `string` | `"Backup"` | no |
| <a name="input_db_allocated_storage"></a> [db\_allocated\_storage](#input\_db\_allocated\_storage) | RDSの割り当てストレージサイズ（GB） | `number` | `100` | no |
| <a name="input_db_apply_immediately"></a> [db\_apply\_immediately](#input\_db\_apply\_immediately) | RDSの変更を即時適用するかどうか | `bool` | `true` | no |
| <a name="input_db_auto_minor_version_upgrade"></a> [db\_auto\_minor\_version\_upgrade](#input\_db\_auto\_minor\_version\_upgrade) | RDSの自動マイナーバージョンアップグレードを有効にするかどうか | `bool` | `false` | no |
| <a name="input_db_backup_retention_period"></a> [db\_backup\_retention\_period](#input\_db\_backup\_retention\_period) | RDSの自動バックアップ保持期間（日数） | `number` | `0` | no |
| <a name="input_db_backup_window"></a> [db\_backup\_window](#input\_db\_backup\_window) | RDSの自動バックアップウィンドウ | `string` | `"15:00-15:30"` | no |
| <a name="input_db_instance_class"></a> [db\_instance\_class](#input\_db\_instance\_class) | RDSインスタンスクラス | `string` | `"db.m7g.large"` | no |
| <a name="input_db_instance_count"></a> [db\_instance\_count](#input\_db\_instance\_count) | RDSインスタンスの数 | `number` | `2` | no |
| <a name="input_db_maintenance_window"></a> [db\_maintenance\_window](#input\_db\_maintenance\_window) | RDSのメンテナンスウィンドウ | `string` | `"Sat:16:00-Sat:16:30"` | no |
| <a name="input_db_max_allocated_storage"></a> [db\_max\_allocated\_storage](#input\_db\_max\_allocated\_storage) | RDSの最大割り当てストレージサイズ（GB） | `number` | `1000` | no |
| <a name="input_db_monitoring_interval"></a> [db\_monitoring\_interval](#input\_db\_monitoring\_interval) | RDSの拡張モニタリングの間隔（秒） | `number` | `60` | no |
| <a name="input_db_performance_insights_enabled"></a> [db\_performance\_insights\_enabled](#input\_db\_performance\_insights\_enabled) | RDSのパフォーマンスインサイトを有効にするかどうか | `string` | `"true"` | no |
| <a name="input_db_performance_insights_retention_period"></a> [db\_performance\_insights\_retention\_period](#input\_db\_performance\_insights\_retention\_period) | RDSのパフォーマンスインサイトの保持期間（日数） | `number` | `7` | no |
| <a name="input_db_root_name"></a> [db\_root\_name](#input\_db\_root\_name) | RDSの管理者ユーザー名 | `string` | `"administrator"` | no |
| <a name="input_db_secret_rotate"></a> [db\_secret\_rotate](#input\_db\_secret\_rotate) | RDSのシークレットローテーションを有効にするかどうか | `bool` | `true` | no |
| <a name="input_db_skip_final_snapshot"></a> [db\_skip\_final\_snapshot](#input\_db\_skip\_final\_snapshot) | RDSの削除時に最終スナップショットを作成しないかどうか | `bool` | `true` | no |
| <a name="input_db_storage_encrypted"></a> [db\_storage\_encrypted](#input\_db\_storage\_encrypted) | RDSのストレージ暗号化を有効にするかどうか | `bool` | `true` | no |
| <a name="input_db_storage_type"></a> [db\_storage\_type](#input\_db\_storage\_type) | RDSのストレージタイプ | `string` | `"gp3"` | no |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | リソースの削除保護を有効にするかどうか | `bool` | `true` | no |
| <a name="input_ebs_encrypted"></a> [ebs\_encrypted](#input\_ebs\_encrypted) | EBSボリュームの暗号化を有効にするかどうか | `bool` | `false` | no |
| <a name="input_ebs_volume_size"></a> [ebs\_volume\_size](#input\_ebs\_volume\_size) | EBSボリュームサイズ（GB） | `number` | `8` | no |
| <a name="input_ebs_volume_type"></a> [ebs\_volume\_type](#input\_ebs\_volume\_type) | EBSボリュームタイプ | `string` | `"gp3"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | 環境名（prd: 本番環境, stg: ステージング環境, dev: 開発環境） | `string` | `"prd"` | no |
| <a name="input_flow_log_file_format_text"></a> [flow\_log\_file\_format\_text](#input\_flow\_log\_file\_format\_text) | VPCフローログのテキスト形式 | `string` | `"plain-text"` | no |
| <a name="input_flow_log_file_parquet"></a> [flow\_log\_file\_parquet](#input\_flow\_log\_file\_parquet) | VPCフローログのParquet形式 | `string` | `"parquet"` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | S3バケットを強制的に削除するかどうか | `bool` | `false` | no |
| <a name="input_has_public_ip_to_computer"></a> [has\_public\_ip\_to\_computer](#input\_has\_public\_ip\_to\_computer) | EC2インスタンスにパブリックIPを割り当てるかどうか | `bool` | `false` | no |
| <a name="input_http_port"></a> [http\_port](#input\_http\_port) | HTTPポート番号 | `number` | `80` | no |
| <a name="input_https_port"></a> [https\_port](#input\_https\_port) | HTTPSポート番号 | `number` | `443` | no |
| <a name="input_instance_rsrc_type_web"></a> [instance\_rsrc\_type\_web](#input\_instance\_rsrc\_type\_web) | Webサーバー用EC2インスタンスリソースタイプの識別子 | `string` | `"web"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | EC2インスタンスタイプ | `string` | `"m7i.large"` | no |
| <a name="input_isolated_subnet_1a_cidr_block"></a> [isolated\_subnet\_1a\_cidr\_block](#input\_isolated\_subnet\_1a\_cidr\_block) | 分離サブネット1aのCIDRブロック | `string` | `"10.0.4.0/24"` | no |
| <a name="input_isolated_subnet_1c_cidr_block"></a> [isolated\_subnet\_1c\_cidr\_block](#input\_isolated\_subnet\_1c\_cidr\_block) | 分離サブネット1cのCIDRブロック | `string` | `"10.0.5.0/24"` | no |
| <a name="input_multi_az"></a> [multi\_az](#input\_multi\_az) | RDSのマルチAZ配置を有効にするかどうか | `bool` | `true` | no |
| <a name="input_naked_domain"></a> [naked\_domain](#input\_naked\_domain) | ベースドメイン名 | `string` | n/a | yes |
| <a name="input_network_rsrc_type_isolated"></a> [network\_rsrc\_type\_isolated](#input\_network\_rsrc\_type\_isolated) | 分離ネットワークリソースタイプの識別子 | `string` | `"isolated"` | no |
| <a name="input_network_rsrc_type_private"></a> [network\_rsrc\_type\_private](#input\_network\_rsrc\_type\_private) | プライベートネットワークリソースタイプの識別子 | `string` | `"private"` | no |
| <a name="input_network_rsrc_type_public"></a> [network\_rsrc\_type\_public](#input\_network\_rsrc\_type\_public) | パブリックネットワークリソースタイプの識別子 | `string` | `"public"` | no |
| <a name="input_object_expiration_days"></a> [object\_expiration\_days](#input\_object\_expiration\_days) | S3オブジェクトの有効期限（日数） | `number` | `366` | no |
| <a name="input_operating_system"></a> [operating\_system](#input\_operating\_system) | 使用するオペレーティングシステム | `string` | `"AMAZON_LINUX_2023"` | no |
| <a name="input_patch_schedule_expression"></a> [patch\_schedule\_expression](#input\_patch\_schedule\_expression) | パッチ適用のスケジュール式（cron形式） | `string` | `"cron(0 19 ? * SAT *)"` | no |
| <a name="input_patch_tag_key"></a> [patch\_tag\_key](#input\_patch\_tag\_key) | パッチ適用対象を識別するためのタグキー | `string` | `"Patch"` | no |
| <a name="input_policy_rsrc_type_backup"></a> [policy\_rsrc\_type\_backup](#input\_policy\_rsrc\_type\_backup) | バックアップポリシーリソースタイプの識別子 | `string` | `"backup"` | no |
| <a name="input_policy_rsrc_type_secret"></a> [policy\_rsrc\_type\_secret](#input\_policy\_rsrc\_type\_secret) | Secrets Managerポリシーリソースタイプの識別子 | `string` | `"secret"` | no |
| <a name="input_policy_rsrc_type_ssm"></a> [policy\_rsrc\_type\_ssm](#input\_policy\_rsrc\_type\_ssm) | SSMポリシーリソースタイプの識別子 | `string` | `"ssm"` | no |
| <a name="input_private_subnet_1a_cidr_block"></a> [private\_subnet\_1a\_cidr\_block](#input\_private\_subnet\_1a\_cidr\_block) | プライベートサブネット1aのCIDRブロック | `string` | `"10.0.2.0/24"` | no |
| <a name="input_private_subnet_1c_cidr_block"></a> [private\_subnet\_1c\_cidr\_block](#input\_private\_subnet\_1c\_cidr\_block) | プライベートサブネット1cのCIDRブロック | `string` | `"10.0.3.0/24"` | no |
| <a name="input_project"></a> [project](#input\_project) | プロジェクト名 | `string` | `"management"` | no |
| <a name="input_public_subnet_1a_cidr_block"></a> [public\_subnet\_1a\_cidr\_block](#input\_public\_subnet\_1a\_cidr\_block) | パブリックサブネット1aのCIDRブロック | `string` | `"10.0.0.0/24"` | no |
| <a name="input_public_subnet_1c_cidr_block"></a> [public\_subnet\_1c\_cidr\_block](#input\_public\_subnet\_1c\_cidr\_block) | パブリックサブネット1cのCIDRブロック | `string` | `"10.0.1.0/24"` | no |
| <a name="input_rds_engine"></a> [rds\_engine](#input\_rds\_engine) | RDSのデータベースエンジン | `string` | `"postgres"` | no |
| <a name="input_rds_engine_major_version"></a> [rds\_engine\_major\_version](#input\_rds\_engine\_major\_version) | RDSのデータベースエンジンのメジャーバージョン | `string` | `"17"` | no |
| <a name="input_rds_engine_minor_version"></a> [rds\_engine\_minor\_version](#input\_rds\_engine\_minor\_version) | RDSのデータベースエンジンのマイナーバージョン | `string` | `"17.2"` | no |
| <a name="input_rds_port"></a> [rds\_port](#input\_rds\_port) | RDSのポート番号 | `number` | `5432` | no |
| <a name="input_s3_rsrc_type_alb"></a> [s3\_rsrc\_type\_alb](#input\_s3\_rsrc\_type\_alb) | ALB用S3バケットリソースタイプの識別子 | `string` | `"alb"` | no |
| <a name="input_s3_rsrc_type_ssm"></a> [s3\_rsrc\_type\_ssm](#input\_s3\_rsrc\_type\_ssm) | SSM用S3バケットリソースタイプの識別子 | `string` | `"ssm"` | no |
| <a name="input_s3_rsrc_type_vpc"></a> [s3\_rsrc\_type\_vpc](#input\_s3\_rsrc\_type\_vpc) | VPC用S3バケットリソースタイプの識別子 | `string` | `"vpc"` | no |
| <a name="input_s3_rsrc_type_waf"></a> [s3\_rsrc\_type\_waf](#input\_s3\_rsrc\_type\_waf) | WAF用S3バケットリソースタイプの識別子 | `string` | `"waf"` | no |
| <a name="input_service_rsrc_type_alb"></a> [service\_rsrc\_type\_alb](#input\_service\_rsrc\_type\_alb) | ALBリソースタイプの識別子 | `string` | `"alb"` | no |
| <a name="input_service_rsrc_type_backup"></a> [service\_rsrc\_type\_backup](#input\_service\_rsrc\_type\_backup) | バックアップリソースタイプの識別子 | `string` | `"backup"` | no |
| <a name="input_service_rsrc_type_ec2"></a> [service\_rsrc\_type\_ec2](#input\_service\_rsrc\_type\_ec2) | EC2リソースタイプの識別子 | `string` | `"ec2"` | no |
| <a name="input_service_rsrc_type_patch"></a> [service\_rsrc\_type\_patch](#input\_service\_rsrc\_type\_patch) | パッチ管理リソースタイプの識別子 | `string` | `"patch"` | no |
| <a name="input_service_rsrc_type_rds"></a> [service\_rsrc\_type\_rds](#input\_service\_rsrc\_type\_rds) | RDSリソースタイプの識別子 | `string` | `"rds"` | no |
| <a name="input_sub_domain"></a> [sub\_domain](#input\_sub\_domain) | サブドメイン名 | `string` | `"test"` | no |
| <a name="input_system"></a> [system](#input\_system) | システム名 | `string` | `"sample"` | no |
| <a name="input_user_data_file"></a> [user\_data\_file](#input\_user\_data\_file) | EC2インスタンスのユーザーデータファイルのパス | `string` | `"../../src/user_data.tpl"` | no |
| <a name="input_versioning_enabled"></a> [versioning\_enabled](#input\_versioning\_enabled) | S3バケットのバージョニングを有効にするかどうか | `bool` | `false` | no |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | VPCのCIDRブロック | `string` | `"10.0.0.0/16"` | no |
| <a name="input_waf_rsrc_type_alb"></a> [waf\_rsrc\_type\_alb](#input\_waf\_rsrc\_type\_alb) | WAFリソースタイプ（ALB用） | `string` | `"alb"` | no |
| <a name="input_waf_white_list"></a> [waf\_white\_list](#input\_waf\_white\_list) | WAFのホワイトリストIPアドレス | `list(string)` | <pre>[<br/>  "0.0.0.0/1",<br/>  "128.0.0.0/1"<br/>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb_dns_name"></a> [alb\_dns\_name](#output\_alb\_dns\_name) | ALBのDNS名。アプリケーションにアクセスするためのエンドポイント |
| <a name="output_rds_db_name"></a> [rds\_db\_name](#output\_rds\_db\_name) | RDSのデータベース名 |
| <a name="output_rds_db_secret_arn"></a> [rds\_db\_secret\_arn](#output\_rds\_db\_secret\_arn) | RDSのデータベース認証情報を格納したSecretsManagerのARN |
| <a name="output_rds_endpoint"></a> [rds\_endpoint](#output\_rds\_endpoint) | RDSのエンドポイント。データベース接続に使用 |
<!-- END_TF_DOCS -->
