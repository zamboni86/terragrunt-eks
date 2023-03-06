include "root" {
  path = find_in_parent_folders()
}

locals {
  common = jsondecode(file(find_in_parent_folders("common_vars.json")))
}

include "env" {
  path = "${get_terragrunt_dir()}/../../_env/vpc.hcl"
}
