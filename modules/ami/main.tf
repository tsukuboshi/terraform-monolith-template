# ====================
#
# AMI
#
# ====================

# Parameter Store のパブリックパラメーターを利用して AMI ID を取得

data "aws_ssm_parameter" "tf_ami" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-6.1-x86_64"
}
