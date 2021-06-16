variable "region" {
  type    = string
  default = "us-west-1"
}

variable "environment" {
  type    = string
  default = "production"
}

variable "vpc_name" {
  type    = string
  default = "Colearn VPC"
}

variable "create_vpc" {
  type    = bool
  default = true
}

variable "vpc_cidr" {
  type    = string
  default = "172.16.0.0/16"
}

variable "public_subnets" {
  type    = list(any)
  default = ["172.16.0.0/24", "172.16.5.0/24"]
}

variable "private_subnets" {
  type    = list(any)
  default = ["172.16.100.0/24", "172.16.105.0/24"]
}

variable "database_subnets" {
  type    = list(any)
  default = ["172.16.200.0/24", "172.16.205.0/24"]
}

variable "enable_nat_gateway" {
  type    = bool
  default = true
}

variable "http_ingress_cidr_blocks" {
  type    = list(any)
  default = ["0.0.0.0/0", ]
}

variable "alb_name" {
  type    = string
  default = "weby-lb"
}

variable "lb_tg_name_prefix" {
  type    = string
  default = "weby-"
}

variable "ecs_cluster_name" {
  type    = string
  default = "weby-production-cluster"
}

variable "db_engine" {
  type    = string
  default = "postgres"
}

variable "db_engine_version" {
  type    = string
  default = "13.2"
}

variable "db_major_engine_version" {
  type    = string
  default = "13"
}

variable "db_family" {
  type    = string
  default = "postgres13"
}

variable "db_instance_size" {
  type    = string
  default = "db.t3.micro"
}

variable "db_allocated_storage" {
  type    = number
  default = 20
}

variable "db_name" {
  type    = string
  default = "webydb"
}

variable "db_username" {
  type    = string
  default = "webydbuser"
}

variable "db_port" {
  type    = number
  default = 5432
}
