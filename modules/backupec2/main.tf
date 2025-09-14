# ====================
#
# Backup Config
#
# ====================

resource "aws_backup_plan" "tf_backup_plan" {
  name = "${var.system}-${var.project}-${var.environment}-backup-plan-ec2"

  rule {
    rule_name         = "${var.system}-${var.project}-${var.environment}-backup-rule-ec2"
    target_vault_name = var.backup_vault_name
    schedule          = var.schedule_expression

    lifecycle {
      delete_after = var.delete_after_days
    }

    start_window      = 60
    completion_window = 240
  }
  tags = {
    Name = "${var.system}-${var.project}-${var.environment}-backup-plan-ec2"
  }
}

resource "aws_backup_selection" "tf_backup_selection" {
  iam_role_arn = var.backup_role_arn
  name         = "${var.system}-${var.project}-${var.environment}-backup-ec2"
  plan_id      = aws_backup_plan.tf_backup_plan.id

  condition {
    string_equals {
      key   = "aws:ResourceTag/${var.backup_tag_key}"
      value = "true"
    }
  }

  resources = ["arn:aws:ec2:*:*:instance/*"]
}
