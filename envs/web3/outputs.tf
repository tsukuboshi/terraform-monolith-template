# ====================
#
# Outputs
#
# ====================

output "url_for_enduser" {
  value = "https://${var.sub_domain}.${var.naked_domain}"
}

output "rds_endpoint" {
  value = module.rds.rds_endpoint
}
