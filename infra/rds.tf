resource "random_password" "db_password" {
  length  = 20
  special = false
}

module "sg-rds" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.0.0"

  name                = "Allow RDS connections - ${var.environment}"
  vpc_id              = module.vpc.vpc_id
  create              = true
  ingress_rules       = ["postgresql-tcp", ]
  ingress_cidr_blocks = var.http_ingress_cidr_blocks
  egress_rules        = ["all-all", ]
  egress_cidr_blocks  = ["0.0.0.0/0", ]
}

module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 3.0"

  identifier = "${var.environment}-db"

  engine               = var.db_engine
  engine_version       = var.db_engine_version
  major_engine_version = var.db_major_engine_version
  family               = var.db_family
  instance_class       = var.db_instance_size
  allocated_storage    = 5

  name     = var.db_name
  username = var.db_username
  password = random_password.db_password.result
  port     = var.db_port

  iam_database_authentication_enabled = true

  vpc_security_group_ids = [module.sg-rds.security_group_id, ]

  tags = {
    Environment = var.environment
  }

  # DB subnet group
  subnet_ids = module.vpc.database_subnets.*
}

resource "aws_secretsmanager_secret" "db_password" {
  name_prefix = "db_password"
}

resource "aws_secretsmanager_secret_version" "db_password_version" {
  secret_id     = aws_secretsmanager_secret.db_password.id
  secret_string = module.db.db_instance_password
}
