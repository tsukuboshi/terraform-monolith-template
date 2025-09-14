# ====================
#
# Variables
#
# ====================

variable "system" {}

variable "project" {}

variable "environment" {}

variable "resourcetype" {}

variable "account_id" {}

variable "force_destroy" {}

variable "versioning_enabled" {}

variable "object_expiration_days" {}

variable "bucket_policy_document_file" {
  default = "./src/bucket_policy_document.json"
}
