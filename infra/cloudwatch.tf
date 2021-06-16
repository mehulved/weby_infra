resource "aws_cloudwatch_log_group" "lg" {
  name = var.log_group_name

  tags = {
    Environment = var.environment
    Application = var.app_name
  }
}
