locals {
  common = jsondecode(file(find_in_parent_folders("common_vars.json")))
}

generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
terraform {
  backend "s3" {
    bucket         = "${local.common.s3_bucket}"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "${local.common.region}"
    encrypt        = true
  }
}
EOF
}