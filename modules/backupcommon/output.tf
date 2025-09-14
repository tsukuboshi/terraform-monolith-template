# ====================
#
# Outputs
#
# ====================

output "backup_vault_name" {
  value = aws_backup_vault.tf_backup_vault.name
}
