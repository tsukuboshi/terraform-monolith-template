resource "aws_wafv2_web_acl_association" "tf_wafv2_web_acl_resource" {
  resource_arn = var.resource_arn
  web_acl_arn  = var.waf_web_acl_arn
}
