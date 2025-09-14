# ====================
#
# Variables
#
# ====================

variable "system" {}

variable "project" {}

variable "environment" {}

variable "resourcetype" {}

variable "deletion_protection" {}

variable "instance_type" {}

variable "subnet_id" {}

variable "associate_public_ip_address" {}

variable "security_group_id" {}

variable "ami_image_id" {}

variable "instance_profile" {}

variable "key_pair_id" {
  default = null
}

variable "user_data_file" {
  default = null
}

variable "ebs_volume_size" {}

variable "ebs_volume_type" {}

variable "ebs_encrypted" {}

variable "outbound_route_id" {}

variable "backup_tag_key" {}

variable "backup_tag_value" {}

variable "patch_tag_key" {}

variable "patch_tag_value" {}
