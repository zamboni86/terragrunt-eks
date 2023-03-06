terraform {
  source = "tfr:///terraform-aws-modules/vpc/aws?version=3.19.0"
}

locals {
  common = jsondecode(file(find_in_parent_folders("common_vars.json")))
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  region = "${local.common.region}"
}
EOF
}

inputs = {
  name               = "${local.common.env}-vpc"
  cidr               = "10.0.0.0/16"
  azs                = ["us-west2a", "us-west-2b", "us-west-2c"]
  public_subnets     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnets    = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  enable_nat_gateway = true
  single_nat_gateway = true
  tags               = local.common.tags
}