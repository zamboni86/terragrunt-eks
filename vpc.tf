module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.vpc_name}-vpc"
  cidr = var.cidr

  azs             = var.avalibility_zones
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
  
  enable_nat_gateway = true

  tags = {
    "terraform": "true",
    "environment": "dev"
  }
}