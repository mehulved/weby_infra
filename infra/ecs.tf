module "ecs" {
  source  = "terraform-aws-modules/ecs/aws"
  version = "3.1.0"

  name               = "${var.environment}-${var.ecs_cluster_name}"
  capacity_providers = ["FARGATE", "FARGATE_SPOT"]
  container_insights = true

  default_capacity_provider_strategy = [
    {
      capacity_provider = "FARGATE_SPOT"
      weight            = "1"

    }
  ]

  tags = {
    Environment = var.environment
  }
}
