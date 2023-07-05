terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.6.2"
    }
  }
}

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Owner       = "Daniel Fedick"
      Purpose     = "DEMOLAND"
      Terraform   = true
      Environment = "development"
      DoNotDelete = true
      Name        = "DEMOLAND VPC"
    }
  }

}
