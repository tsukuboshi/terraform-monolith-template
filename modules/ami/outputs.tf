# ====================
#
# Outputs
#
# ====================

output "ami_image_id" {
  value = data.aws_ssm_parameter.tf_ami.value
}
