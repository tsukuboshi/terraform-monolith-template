# ====================
#
# Backup Config
#
# ====================

resource "aws_backup_vault" "tf_backup_vault" {
  name          = "${var.system}-${var.project}-${var.environment}-backup-vault"
  force_destroy = var.force_destroy
}
