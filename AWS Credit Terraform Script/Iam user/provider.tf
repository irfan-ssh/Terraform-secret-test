
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.8.0"
    }
  }
}
# Default region
provider "aws" {
  region = "us-east-1"
  alias  = "root"
}

    provider "aws" {
    region = "us-east-1"
    allowed_account_ids = ["${var.account_id}"]
    assume_role {
      role_arn = "arn:aws:iam::${var.account_id}:role/Admin"
    }
  }