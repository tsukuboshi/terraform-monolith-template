# ====================
#
# Terraform
#
# ====================

terraform {
  required_version = ">=1.10.0"

  # backend "s3" {
  #   bucket = "tsukuboshi-bucket-tf-backend"
  #   key    = "terraform.tfstate"
  #   region = "ap-northeast-1"

  #   dynamodb_table = "tsukuboshi-ddb-tf-backend"
  # }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
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

data "aws_region" "region" {}
