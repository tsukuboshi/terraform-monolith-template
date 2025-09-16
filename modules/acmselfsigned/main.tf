# ====================
#
# ACM Self Signed
#
# ====================

# 自己署名証明書の作成(カスタムドメインが発行待ちになっている場合に暫定的にALBにHTTPSアクセスしたい場合に使用)

# ルート証明書
resource "tls_private_key" "root_ca" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "tls_self_signed_cert" "root_ca" {
  private_key_pem       = tls_private_key.root_ca.private_key_pem
  validity_period_hours = 87600
  is_ca_certificate     = true

  subject {
    common_name  = "root"
    organization = "mycorp."
    country      = "JP"
    province     = "Tokyo"
  }
  allowed_uses = [
    "cert_signing",
    "crl_signing",
  ]
}

# サーバー証明書
resource "tls_private_key" "server" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "tls_cert_request" "server" {
  private_key_pem = tls_private_key.server.private_key_pem
  dns_names       = [var.common_name]

  subject {
    common_name  = var.common_name
    organization = "mycorp."
    country      = "JP"
    province     = "Tokyo"
  }
}
resource "tls_locally_signed_cert" "server" {
  cert_request_pem      = tls_cert_request.server.cert_request_pem
  ca_private_key_pem    = tls_private_key.root_ca.private_key_pem
  ca_cert_pem           = tls_self_signed_cert.root_ca.cert_pem
  validity_period_hours = 8760
  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
  ]
}

# ACMへの証明書インポート
resource "aws_acm_certificate" "main" {
  private_key       = tls_private_key.server.private_key_pem
  certificate_body  = tls_locally_signed_cert.server.cert_pem
  certificate_chain = tls_self_signed_cert.root_ca.cert_pem
  lifecycle {
    # 現在使用中の証明書を置き換える作業が妨げられてしまう現象を回避するための設定
    create_before_destroy = true
  }
}

# 証明書ファイルのローカル保存
resource "local_file" "root_ca_cert" {
  content  = tls_self_signed_cert.root_ca.cert_pem
  filename = "${path.module}/../../certs/${var.environment}/root_ca.pem"
}

resource "local_file" "server_key" {
  content  = tls_private_key.server.private_key_pem
  filename = "${path.module}/../../certs/${var.environment}/server.key"
}

resource "local_file" "server_cert" {
  content  = tls_locally_signed_cert.server.cert_pem
  filename = "${path.module}/../../certs/${var.environment}/server.pem"
}
