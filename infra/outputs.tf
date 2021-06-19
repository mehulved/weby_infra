output "azs" {
  value = data.aws_availability_zones.azs.names
}

output "address" {
  value = module.alb.lb_dns_name
}

output "cluster_name" {
  value = module.ecs.ecs_cluster_name
}

output "cluster_arn" {
  value = module.ecs.ecs_cluster_arn
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "lb_arn" {
  value = module.alb.lb_arn
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnets_cidr_blocks" {
  value = module.vpc.private_subnets_cidr_blocks
}

output "http_sg_id" {
  value = module.sg-http.security_group_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "public_subnets_cidr_blocks" {
  value = module.vpc.public_subnets_cidr_blocks
}

output "db_endpoint" {
  value = module.db.db_instance_address
}

output "db_username" {
  value     = module.db.db_instance_username
  sensitive = true
}

output "db_password" {
  value     = module.db.db_instance_password
  sensitive = true
}

output "db_name" {
  value     = module.db.db_instance_name
  sensitive = true
}

output "db_engine" {
  value = var.db_engine
}

output "log_group_name" {
  value = var.log_group_name
}

output "repo_url" {
  value = aws_ecr_repository.repo.repository_url
}

output "cdn_bucket" {
  value = aws_s3_bucket.asset_bucket.bucket_regional_domain_name
}

output "cdn_hostname" {
  value = aws_cloudfront_distribution.asset_cdn.domain_name
}
