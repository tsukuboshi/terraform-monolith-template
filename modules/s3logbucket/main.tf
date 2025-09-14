# ====================
#
# S3 Bucket
#
# ====================

data "aws_caller_identity" "tf_caller_identity" {}

resource "aws_s3_bucket" "tf_bucket_log" {
  bucket        = "aws-${var.resourcetype}-logs-${var.system}-${var.project}-${var.environment}-${var.account_id}"
  force_destroy = var.force_destroy
}

resource "aws_s3_bucket_ownership_controls" "tf_bucket_ownership_controls_log" {
  bucket = aws_s3_bucket.tf_bucket_log.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_public_access_block" "tf_public_access_block_log" {
  bucket                  = aws_s3_bucket.tf_bucket_log.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_lifecycle_configuration" "tf_bucket_lifecycle_configuration_log" {
  bucket = aws_s3_bucket.tf_bucket_log.id

  rule {
    id = "${var.system}-${var.project}-${var.environment}-${var.resourcetype}-log-${var.account_id}-lifecycle"
    expiration {
      days = var.object_expiration_days
    }
    status = "Enabled"
    abort_incomplete_multipart_upload {
      days_after_initiation = 7
    }
  }
}

resource "aws_s3_bucket_versioning" "tf_bucket_versioning_log" {
  bucket = aws_s3_bucket.tf_bucket_log.id
  versioning_configuration {
    status = var.versioning_enabled == true ? "Enabled" : "Disabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tf_bucket_encrypt_config_log" {
  bucket = aws_s3_bucket.tf_bucket_log.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
