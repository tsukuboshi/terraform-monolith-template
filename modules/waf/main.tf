
resource "aws_wafv2_ip_set" "tf_wafv2_ip_set" {
  name               = "${var.system}-${var.project}-${var.environment}-${var.resourcetype}-ips"
  scope              = "REGIONAL"
  ip_address_version = "IPV4"
  addresses          = var.waf_white_list
}

resource "aws_wafv2_web_acl" "tf_wafv2_web_acl" {
  name  = "${var.system}-${var.project}-${var.environment}-${var.resourcetype}-waf-wacl"
  scope = "REGIONAL"

  default_action {
    allow {}
  }

  rule {
    name     = "IPRateLimit"
    priority = 1

    action {
      dynamic "block" {
        for_each = var.waf_ip_rule_block_mode ? [1] : []
        content {}
      }

      dynamic "count" {
        for_each = var.waf_ip_rule_block_mode ? [] : [1]
        content {}
      }
    }

    statement {
      not_statement {
        statement {
          ip_set_reference_statement {
            arn = aws_wafv2_ip_set.tf_wafv2_ip_set.arn
          }
        }
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = var.waf_cloudwatch_metrics_enabled
      metric_name                = "IPRateLimitMetric"
      sampled_requests_enabled   = var.waf_sampled_requests_enabled
    }
  }

  rule {
    name     = "AWS-AWSManagedRulesCommonRuleSet"
    priority = 2

    override_action {
      dynamic "none" {
        for_each = var.waf_managed_rule_block_mode ? [1] : []
        content {}
      }

      dynamic "count" {
        for_each = var.waf_managed_rule_block_mode ? [] : [1]
        content {}
      }
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesCommonRuleSet"
        vendor_name = "AWS"
      }
    }
    visibility_config {
      cloudwatch_metrics_enabled = var.waf_cloudwatch_metrics_enabled
      metric_name                = "AWSManagedRulesCommonRuleSetMetric"
      sampled_requests_enabled   = var.waf_sampled_requests_enabled
    }
  }

  rule {
    name     = "AWS-AWSManagedRulesKnownBadInputsRuleSet"
    priority = 3

    override_action {
      dynamic "none" {
        for_each = var.waf_managed_rule_block_mode ? [1] : []
        content {}
      }

      dynamic "count" {
        for_each = var.waf_managed_rule_block_mode ? [] : [1]
        content {}
      }
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesKnownBadInputsRuleSet"
        vendor_name = "AWS"
      }
    }
    visibility_config {
      cloudwatch_metrics_enabled = var.waf_cloudwatch_metrics_enabled
      metric_name                = "AWSManagedRulesKnownBadInputsRuleSetMetric"
      sampled_requests_enabled   = var.waf_sampled_requests_enabled
    }
  }

  rule {
    name     = "AWS-AWSManagedRulesSQLiRuleSet"
    priority = 4

    override_action {
      dynamic "none" {
        for_each = var.waf_managed_rule_block_mode ? [1] : []
        content {}
      }

      dynamic "count" {
        for_each = var.waf_managed_rule_block_mode ? [] : [1]
        content {}
      }
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesSQLiRuleSet"
        vendor_name = "AWS"
      }
    }
    visibility_config {
      cloudwatch_metrics_enabled = var.waf_cloudwatch_metrics_enabled
      metric_name                = "AWSManagedRulesSQLiRuleSetMetric"
      sampled_requests_enabled   = var.waf_sampled_requests_enabled
    }
  }

  rule {
    name     = "AWS-AWSManagedRulesLinuxRuleSet"
    priority = 5

    override_action {
      dynamic "none" {
        for_each = var.waf_managed_rule_block_mode ? [1] : []
        content {}
      }

      dynamic "count" {
        for_each = var.waf_managed_rule_block_mode ? [] : [1]
        content {}
      }
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesLinuxRuleSet"
        vendor_name = "AWS"
      }
    }
    visibility_config {
      cloudwatch_metrics_enabled = var.waf_cloudwatch_metrics_enabled
      metric_name                = "AWSManagedRulesLinuxRuleSetMetric"
      sampled_requests_enabled   = var.waf_sampled_requests_enabled
    }
  }

  rule {
    name     = "AWS-AWSManagedRulesAmazonIpReputationList"
    priority = 6

    override_action {
      dynamic "none" {
        for_each = var.waf_managed_rule_block_mode ? [1] : []
        content {}
      }

      dynamic "count" {
        for_each = var.waf_managed_rule_block_mode ? [] : [1]
        content {}
      }
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesAmazonIpReputationList"
        vendor_name = "AWS"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = var.waf_cloudwatch_metrics_enabled
      metric_name                = "AWSManagedRulesAmazonIpReputationListMetric"
      sampled_requests_enabled   = var.waf_sampled_requests_enabled
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = var.waf_cloudwatch_metrics_enabled
    metric_name                = "TerraformWebACLMetric"
    sampled_requests_enabled   = var.waf_sampled_requests_enabled
  }
}

resource "aws_wafv2_web_acl_logging_configuration" "tf_wafv2_web_acl_log" {
  count                   = var.has_web_acl_log ? 1 : 0
  log_destination_configs = [var.waf_log_bucket_arn]
  resource_arn            = aws_wafv2_web_acl.tf_wafv2_web_acl.arn
}
