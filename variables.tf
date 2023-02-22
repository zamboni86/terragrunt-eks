variable "avalibility_zones" {
  description = "List of avalibility zones"
  type        = list
  default     = ["us-west-2a", "us-west-2b", "us-west-2c"]
}

variable "cidr" {
  description = "The IPv4 CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "private_subnets" {
  description = "Private subnet CIDRs"
  type        = list
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnets" {
  description = "Private subnet CIDRs"
  type        = list
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "vpc_name" {
  description = "Name associated with created resources"
  type        = string
  default     = "example"
}
