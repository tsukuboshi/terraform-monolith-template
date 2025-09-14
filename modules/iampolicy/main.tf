# ====================
#
# IAM Managed Policy
#
# ====================

resource "aws_iam_policy" "tf_iam_policy" {
  name   = "${var.system}-${var.project}-${var.environment}-${var.resourcetype}-policy"
  policy = data.aws_iam_policy_document.tf_iam_policy_document.json
}

data "aws_iam_policy_document" "tf_iam_policy_document" {
  statement {
    effect    = "Allow"
    actions   = var.action_list
    resources = var.resource_arn_list
  }
}
