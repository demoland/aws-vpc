locals {
  cluster1_name = "dgs-1"
}


module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.name
  cidr = "${var.cidr_prefix}.0.0/${var.vpc_mask}"

  azs             = ["${var.region}a", "${var.region}b"]
  private_subnets = ["${var.cidr_prefix}.101.0/${var.subnet_mask}", "${var.cidr_prefix}.102.0/${var.subnet_mask}"]
  public_subnets  = ["${var.cidr_prefix}.1.0/${var.subnet_mask}", "${var.cidr_prefix}.2.0/${var.subnet_mask}"]

  enable_nat_gateway = true
  enable_vpn_gateway = true


  # Cluster Tags:
  public_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster1_name}" = "shared"
    "kubernetes.io/role/elb"                       = 1
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster1_name}" = "shared"
    "kubernetes.io/role/internal-elb"              = 1
  }

}