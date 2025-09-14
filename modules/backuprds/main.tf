# ====================
#
# Backup Config
#
# ====================

resource "aws_backup_plan" "tf_backup_plan" {
  name = "${var.system}-${var.project}-${var.environment}-backup-plan-rds"

  rule {
    rule_name         = "${var.system}-${var.project}-${var.environment}-backup-rule-rds"
    target_vault_name = var.backup_vault_name
    schedule          = var.schedule_expression

    lifecycle {
      delete_after = var.delete_after_days
    }

    start_window      = 60
    completion_window = 120
  }
  tags = {
    Name = "${var.system}-${var.project}-${var.environment}-backup-plan-rds"
  }
}

resource "aws_backup_selection" "tf_backup_selection" {
  iam_role_arn = var.backup_role_arn
  name         = "${var.system}-${var.project}-${var.environment}-backup-rds"
  plan_id      = aws_backup_plan.tf_backup_plan.id

  condition {
    string_equals {
      key   = "aws:ResourceTag/${var.backup_tag_key}"
      value = "true"
    }
  }

  resources = ["arn:aws:rds:*:*:db:*"]

}
