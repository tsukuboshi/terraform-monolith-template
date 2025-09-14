# ====================
#
# Variables
#
# ====================


## Common ##

variable "aws_region" {
  description = "AWSのリージョン。デフォルトは東京リージョン"
  default     = "ap-northeast-1"
  type        = string
}

variable "availability_zone_1a" {
  description = "使用するアベイラビリティゾーン1a"
  default     = "ap-northeast-1a"
  type        = string
}

variable "availability_zone_1c" {
  description = "使用するアベイラビリティゾーン1c"
  default     = "ap-northeast-1c"
  type        = string
}

variable "az_short_name_1a" {
  description = "アベイラビリティゾーン1aの短縮名"
  default     = "1a"
  type        = string
}

variable "az_short_name_1c" {
  description = "アベイラビリティゾーン1cの短縮名"
  default     = "1c"
  type        = string
}

variable "system" {
  description = "システム名"
  default     = "sample"
  type        = string
}

variable "project" {
  description = "プロジェクト名"
  default     = "management"
  type        = string
}

variable "environment" {
  description = "環境名（prd: 本番環境, stg: ステージング環境, dev: 開発環境）"
  default     = "prd"
  type        = string
}

variable "deletion_protection" {
  description = "リソースの削除保護を有効にするかどうか"
  default     = true
  type        = bool
}

variable "force_destroy" {
  description = "S3バケットを強制的に削除するかどうか"
  default     = false
  type        = bool
}

variable "naked_domain" {
  description = "ベースドメイン名"
  # default = "example.com"
  type = string
}

variable "sub_domain" {
  description = "サブドメイン名"
  default     = "test"
  type        = string
}

variable "service_rsrc_type_alb" {
  description = "ALBリソースタイプの識別子"
  default     = "alb"
  type        = string
}

variable "service_rsrc_type_ec2" {
  description = "EC2リソースタイプの識別子"
  default     = "ec2"
  type        = string
}

variable "service_rsrc_type_rds" {
  description = "RDSリソースタイプの識別子"
  default     = "rds"
  type        = string
}

variable "service_rsrc_type_backup" {
  description = "バックアップリソースタイプの識別子"
  default     = "backup"
  type        = string
}

variable "service_rsrc_type_patch" {
  description = "パッチ管理リソースタイプの識別子"
  default     = "patch"
  type        = string
}

# IAM #
variable "policy_rsrc_type_ssm" {
  description = "SSMポリシーリソースタイプの識別子"
  default     = "ssm"
  type        = string
}

variable "policy_rsrc_type_backup" {
  description = "バックアップポリシーリソースタイプの識別子"
  default     = "backup"
  type        = string
}

variable "policy_rsrc_type_secret" {
  description = "Secrets Managerポリシーリソースタイプの識別子"
  default     = "secret"
  type        = string
}

# VPC #
variable "vpc_cidr_block" {
  description = "VPCのCIDRブロック"
  default     = "10.0.0.0/16"
  type        = string
}

variable "flow_log_file_format_text" {
  description = "VPCフローログのテキスト形式"
  default     = "plain-text"
  type        = string
}

variable "flow_log_file_parquet" {
  description = "VPCフローログのParquet形式"
  default     = "parquet"
  type        = string
}

# Subnet #
variable "public_subnet_1a_cidr_block" {
  description = "パブリックサブネット1aのCIDRブロック"
  default     = "10.0.0.0/24"
  type        = string
}

variable "public_subnet_1c_cidr_block" {
  description = "パブリックサブネット1cのCIDRブロック"
  default     = "10.0.1.0/24"
  type        = string
}

variable "private_subnet_1a_cidr_block" {
  description = "プライベートサブネット1aのCIDRブロック"
  default     = "10.0.2.0/24"
  type        = string
}

variable "private_subnet_1c_cidr_block" {
  description = "プライベートサブネット1cのCIDRブロック"
  default     = "10.0.3.0/24"
  type        = string
}

variable "isolated_subnet_1a_cidr_block" {
  description = "分離サブネット1aのCIDRブロック"
  default     = "10.0.4.0/24"
  type        = string
}

variable "isolated_subnet_1c_cidr_block" {
  description = "分離サブネット1cのCIDRブロック"
  default     = "10.0.5.0/24"
  type        = string
}

variable "network_rsrc_type_public" {
  description = "パブリックネットワークリソースタイプの識別子"
  default     = "public"
  type        = string
}

variable "network_rsrc_type_private" {
  description = "プライベートネットワークリソースタイプの識別子"
  default     = "private"
  type        = string
}

variable "network_rsrc_type_isolated" {
  description = "分離ネットワークリソースタイプの識別子"
  default     = "isolated"
  type        = string
}

# EC2 #
variable "ami_id" {
  description = "使用するAMIのID"
  default     = "ami-02e5504ea463e3f34"
  type        = string
}

variable "has_public_ip_to_computer" {
  description = "EC2インスタンスにパブリックIPを割り当てるかどうか"
  default     = false
  type        = bool
}

variable "operating_system" {
  description = "使用するオペレーティングシステム"
  default     = "AMAZON_LINUX_2023"
  type        = string
}

# S3 #
variable "s3_rsrc_type_vpc" {
  description = "VPC用S3バケットリソースタイプの識別子"
  default     = "vpc"
  type        = string
}

variable "s3_rsrc_type_alb" {
  description = "ALB用S3バケットリソースタイプの識別子"
  default     = "alb"
  type        = string
}

variable "s3_rsrc_type_waf" {
  description = "WAF用S3バケットリソースタイプの識別子"
  default     = "waf"
  type        = string
}

variable "s3_rsrc_type_ssm" {
  description = "SSM用S3バケットリソースタイプの識別子"
  default     = "ssm"
  type        = string
}

variable "versioning_enabled" {
  description = "S3バケットのバージョニングを有効にするかどうか"
  default     = false
  type        = bool
}

variable "object_expiration_days" {
  description = "S3オブジェクトの有効期限（日数）"
  default     = 366
  type        = number
}

# ALB #
variable "http_port" {
  description = "HTTPポート番号"
  default     = 80
  type        = number
}

variable "https_port" {
  description = "HTTPSポート番号"
  default     = 443
  type        = number
}

variable "access_log_prefix" {
  description = "ALBアクセスログのプレフィックス"
  default     = "alb"
  type        = string
}

variable "alb_target_type_ec2" {
  description = "ALBターゲットタイプ（EC2インスタンス用）"
  default     = "instance"
  type        = string
}

variable "alb_tg_rsrc_type_enduser" {
  description = "ALBターゲットグループリソースタイプ（エンドユーザー用）"
  default     = "enduser"
  type        = string
}

# WAF #
variable "waf_rsrc_type_alb" {
  description = "WAFリソースタイプ（ALB用）"
  default     = "alb"
  type        = string
}

variable "waf_white_list" {
  description = "WAFのホワイトリストIPアドレス"
  default     = ["0.0.0.0/1", "128.0.0.0/1"]
  type        = list(string)
}

# EC2 #
variable "instance_type" {
  description = "EC2インスタンスタイプ"
  default     = "m7i.large"
  type        = string
}

variable "ebs_volume_size" {
  description = "EBSボリュームサイズ（GB）"
  default     = 8
  type        = number
}

variable "ebs_volume_type" {
  description = "EBSボリュームタイプ"
  default     = "gp3"
  type        = string
}

variable "ebs_encrypted" {
  description = "EBSボリュームの暗号化を有効にするかどうか"
  default     = false
  type        = bool
}

variable "user_data_file" {
  description = "EC2インスタンスのユーザーデータファイルのパス"
  default     = "../../src/user_data.tpl"
  type        = string
}

variable "instance_rsrc_type_web" {
  description = "Webサーバー用EC2インスタンスリソースタイプの識別子"
  default     = "web"
  type        = string
}

# RDS #
variable "db_instance_count" {
  description = "RDSインスタンスの数"
  default     = 2
  type        = number
}

variable "multi_az" {
  description = "RDSのマルチAZ配置を有効にするかどうか"
  default     = true
  type        = bool
}

variable "rds_engine" {
  description = "RDSのデータベースエンジン"
  default     = "postgres"
  type        = string
}

variable "rds_engine_major_version" {
  description = "RDSのデータベースエンジンのメジャーバージョン"
  default     = "17"
  type        = string
}

variable "rds_engine_minor_version" {
  description = "RDSのデータベースエンジンのマイナーバージョン"
  default     = "17.2"
  type        = string
}

variable "rds_port" {
  description = "RDSのポート番号"
  default     = 5432
  type        = number
}

variable "db_instance_class" {
  description = "RDSインスタンスクラス"
  default     = "db.m7g.large"
  type        = string
}

variable "db_root_name" {
  description = "RDSの管理者ユーザー名"
  default     = "administrator"
  type        = string
}

variable "db_storage_type" {
  description = "RDSのストレージタイプ"
  default     = "gp3"
  type        = string
}

variable "db_allocated_storage" {
  description = "RDSの割り当てストレージサイズ（GB）"
  default     = 100
  type        = number
}

variable "db_max_allocated_storage" {
  description = "RDSの最大割り当てストレージサイズ（GB）"
  default     = 1000
  type        = number
}

variable "db_storage_encrypted" {
  description = "RDSのストレージ暗号化を有効にするかどうか"
  default     = true
  type        = bool
}

variable "db_backup_retention_period" {
  description = "RDSの自動バックアップ保持期間（日数）"
  default     = 0
  type        = number
}

variable "db_backup_window" {
  description = "RDSの自動バックアップウィンドウ"
  default     = "15:00-15:30"
  type        = string
}

variable "db_maintenance_window" {
  description = "RDSのメンテナンスウィンドウ"
  default     = "Sat:16:00-Sat:16:30"
  type        = string
}

variable "db_performance_insights_enabled" {
  description = "RDSのパフォーマンスインサイトを有効にするかどうか"
  default     = "true"
  type        = string
}

variable "db_performance_insights_retention_period" {
  description = "RDSのパフォーマンスインサイトの保持期間（日数）"
  default     = 7
  type        = number
}

variable "db_monitoring_interval" {
  description = "RDSの拡張モニタリングの間隔（秒）"
  default     = 60
  type        = number
}

variable "db_auto_minor_version_upgrade" {
  description = "RDSの自動マイナーバージョンアップグレードを有効にするかどうか"
  default     = false
  type        = bool
}

variable "db_skip_final_snapshot" {
  description = "RDSの削除時に最終スナップショットを作成しないかどうか"
  default     = true
  type        = bool
}

variable "db_apply_immediately" {
  description = "RDSの変更を即時適用するかどうか"
  default     = true
  type        = bool
}

variable "db_secret_rotate" {
  description = "RDSのシークレットローテーションを有効にするかどうか"
  default     = true
  type        = bool
}

# Backup #
variable "backup_schedule_expression" {
  description = "バックアップのスケジュール式（cron形式）"
  default     = "cron(0 16 * * ? *)" // 毎日1:00 JST
  type        = string
}

variable "backup_delete_after_days" {
  description = "バックアップの保持期間（日数）"
  default     = 7
  type        = number
}

variable "backup_tag_key" {
  description = "バックアップ対象を識別するためのタグキー"
  default     = "Backup"
  type        = string
}

# Patch #
variable "patch_schedule_expression" {
  description = "パッチ適用のスケジュール式（cron形式）"
  default     = "cron(0 19 ? * SAT *)" // 毎週日曜日4:00 JST
  type        = string
}

variable "patch_tag_key" {
  description = "パッチ適用対象を識別するためのタグキー"
  default     = "Patch"
  type        = string
}
