terraform {
  backend "s3" {
    bucket         = "colearn-tf"
    key            = "base/terraform.tfstate"
    region         = "us-west-1"
    dynamodb_table = "terraform-lock"
  }
}
