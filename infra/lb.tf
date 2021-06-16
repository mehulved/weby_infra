module "sg-http" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.0.0"

  name                = "Allow HTTP connections"
  vpc_id              = module.vpc.vpc_id
  create              = true
  ingress_rules       = ["http-80-tcp", ]
  ingress_cidr_blocks = var.http_ingress_cidr_blocks
  egress_rules        = ["all-all", ]
  egress_cidr_blocks  = ["0.0.0.0/0", ]
}

module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "6.1.0"

  name = "${var.environment}-${var.alb_name}"

  load_balancer_type = "application"

  vpc_id          = module.vpc.vpc_id
  subnets         = [module.vpc.public_subnets[0], module.vpc.private_subnets[1], ]
  security_groups = [module.sg-http.security_group_id, ]

  tags = {
    Environment = var.environment
  }

}
