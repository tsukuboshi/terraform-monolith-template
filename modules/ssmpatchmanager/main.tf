# SSM Patch Baseline
resource "aws_ssm_patch_baseline" "tf_ssm_patch_baseline" {
  name             = "${var.system}-${var.project}-${var.environment}-patch-baseline"
  operating_system = var.operating_system

  approval_rule {
    approve_after_days = 7
    patch_filter {
      key    = "CLASSIFICATION"
      values = ["Security"]
    }
    patch_filter {
      key    = "SEVERITY"
      values = ["Important", "Critical"]
    }
  }

  approval_rule {
    approve_after_days = 7
    patch_filter {
      key    = "CLASSIFICATION"
      values = ["Bugfix"]
    }
  }
}

resource "aws_ssm_patch_group" "tf_ssm_patch_group_scan" {
  baseline_id = aws_ssm_patch_baseline.tf_ssm_patch_baseline.id
  patch_group = "${var.system}-${var.project}-${var.environment}-patch-group-scan"
}

# Maintenance Window
resource "aws_ssm_maintenance_window" "tf_ssm_maintenance_window" {
  name                       = "${var.system}-${var.project}-${var.environment}-patch-window"
  schedule                   = var.schedule_expression
  duration                   = 1
  cutoff                     = 0
  allow_unassociated_targets = true
}

# Maintenance Window Target - Scan
resource "aws_ssm_maintenance_window_target" "tf_ssm_maintenance_window_target_scan" {
  name          = "${var.system}-${var.project}-${var.environment}-patch-target-scan"
  window_id     = aws_ssm_maintenance_window.tf_ssm_maintenance_window.id
  resource_type = "INSTANCE"

  targets {
    key    = "tag:${var.patch_tag_key}"
    values = ["scan"]
  }
}

# Maintenance Window Task - Scan
resource "aws_ssm_maintenance_window_task" "tf_ssm_maintenance_window_task_scan" {
  name            = "${var.system}-${var.project}-${var.environment}-patch-task-scan"
  max_concurrency = "50%"
  max_errors      = "50%"
  priority        = 1
  task_arn        = "AWS-RunPatchBaseline"
  task_type       = "RUN_COMMAND"
  window_id       = aws_ssm_maintenance_window.tf_ssm_maintenance_window.id

  targets {
    key    = "WindowTargetIds"
    values = [aws_ssm_maintenance_window_target.tf_ssm_maintenance_window_target_scan.id]
  }

  task_invocation_parameters {
    run_command_parameters {
      timeout_seconds = 1800
      parameter {
        name   = "Operation"
        values = ["Scan"]
      }
      parameter {
        name   = "RebootOption"
        values = ["NoReboot"]
      }
    }
  }
}

# # Maintenance Window Target - Install
# resource "aws_ssm_maintenance_window_target" "aws_ssm_maintenance_window_target_install" {
#     name          = "${var.system}-${var.project}-${var.environment}-patch-target-install"
#     window_id     = aws_ssm_maintenance_window.tf_ssm_maintenance_window.id
#     resource_type = "INSTANCE"

#     targets {
#         key    = "tag:${var.patch_tag_key}"
#         values = ["install"]
#     }
# }

# # Maintenance Window Task - Install
# resource "aws_ssm_maintenance_window_task" "aws_ssm_maintenance_window_task_install" {
#     name            = "${var.system}-${var.project}-${var.environment}-patch-task-install"
#     max_concurrency = "50%"
#     max_errors      = "50%"
#     priority        = 1
#     task_arn        = "AWS-RunPatchBaseline"
#     task_type       = "RUN_COMMAND"
#     window_id       = aws_ssm_maintenance_window.tf_ssm_maintenance_window.id

#     targets {
#         key    = "WindowTargetIds"
#         values = [aws_ssm_maintenance_window_target.aws_ssm_maintenance_window_target_install[0].id]
#     }

#     task_invocation_parameters {
#         run_command_parameters {
#             timeout_seconds = 1800
#             parameter {
#                 name   = "Operation"
#                 values = ["Install"]
#             }
#             parameter {
#                 name   = "RebootOption"
#                 values = ["NoReboot"]
#         }
#     }
# }
