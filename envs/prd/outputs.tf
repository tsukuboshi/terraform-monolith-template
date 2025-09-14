# ====================
#
# Outputs
#
# ====================

output "alb_dns_name" {
  description = "ALBのDNS名。アプリケーションにアクセスするためのエンドポイント"
  value       = module.alb.alb_dns_name
}

output "rds_endpoint" {
  description = "RDSのエンドポイント。データベース接続に使用"
  value       = module.rds.rds_endpoint
}

output "rds_db_name" {
  description = "RDSのデータベース名"
  value       = module.rds.rds_db_name
}

output "rds_db_secret_arn" {
  description = "RDSのデータベース認証情報を格納したSecretsManagerのARN"
  value       = module.rds.rds_db_secret_arn
}
