variable "region" {
  type    = string
  default = "us-west-1"
}

variable "state_bucket_name" {
  type    = string
  default = "colearn-tf"
}

variable "dynamodb_lock_table_name" {
  type    = string
  default = "terraform-lock"
}
