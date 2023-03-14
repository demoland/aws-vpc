terraform {
  required_version = "~> 1.4.0"
  backend "remote" {
    organization = "DCGS"
    workspaces {
      name = "aws-vpc"
    }
  }
}
