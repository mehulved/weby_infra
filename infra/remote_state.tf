terraform {
  backend "s3" {
    bucket         = "colearn-tf"
    key            = "infra/production/terraform.tfstate"
    region         = "us-west-1"
    dynamodb_table = "terraform-lock"
  }
}
