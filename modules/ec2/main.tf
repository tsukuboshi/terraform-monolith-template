# ====================
#
# EC2 Instance
#
# ====================

resource "aws_instance" "tf_instance" {
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  associate_public_ip_address = var.associate_public_ip_address
  vpc_security_group_ids      = [var.security_group_id]
  ami                         = var.ami_image_id
  iam_instance_profile        = var.instance_profile
  disable_api_termination     = var.deletion_protection == true ? true : false
  ebs_optimized               = true

  key_name = var.key_pair_id

  user_data = file(var.user_data_file)

  ebs_block_device {
    device_name           = "/dev/xvda"
    volume_size           = var.ebs_volume_size
    volume_type           = var.ebs_volume_type
    delete_on_termination = true
    encrypted             = var.ebs_encrypted

    tags = {
      Name = "${var.system}-${var.project}-${var.environment}-${var.resourcetype}-ebs"
    }
  }

  tags = {
    Name                    = "${var.system}-${var.project}-${var.environment}-${var.resourcetype}-instance"
    "${var.backup_tag_key}" = "${var.backup_tag_value}"
    "${var.patch_tag_key}"  = "${var.patch_tag_value}"
  }

  depends_on = [
    var.outbound_route_id
  ]
}
