data "aws_availability_zones" "azs" {}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.0.0"

  name                   = var.vpc_name
  create_vpc             = var.create_vpc
  cidr                   = var.vpc_cidr
  azs                    = data.aws_availability_zones.azs.names
  public_subnets         = var.public_subnets
  private_subnets        = var.private_subnets
  database_subnets       = var.database_subnets
  enable_nat_gateway     = var.enable_nat_gateway
  one_nat_gateway_per_az = true
  single_nat_gateway     = false
}
