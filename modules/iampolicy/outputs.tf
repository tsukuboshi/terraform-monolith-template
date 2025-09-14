# ====================
#
# Outputs
#
# ====================

output "iam_policy_arn" {
  value = aws_iam_policy.tf_iam_policy.arn
}
