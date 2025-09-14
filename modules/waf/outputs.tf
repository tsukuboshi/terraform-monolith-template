# ====================
#
# Outputs
#
# ====================

output "web_acl_arn" {
  value = aws_wafv2_web_acl.tf_wafv2_web_acl.arn
}
