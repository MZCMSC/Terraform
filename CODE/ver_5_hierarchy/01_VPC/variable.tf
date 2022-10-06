variable "region" {
  description = "AWS Region"
  type        = string
  default     = ""
}
variable "prefix" {
  description = "AWS Prefix"
  type        = string
  default     = ""
}
variable "azs" {
  description = "AWS Availability zone"
  type        = list(string)
  default     = []
}
variable "vpc_name" {
  description = "VPC Name"
  type        = string
  default     = ""
}
variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
  default     = ""
}
variable "enable_dns_hostnames" {
  description = "DNS hostname support for VPC"
  type    = string
  default = "true"
}
variable "enable_dns_support" {
  description = "DNS support for VPC"
  type    = string
  default = "true"
}

variable "enable_internet_gateway" {
  description = "Internet gateway whether or not use"
  type        = string
  default     = "false"
}

variable "enable_nat_gateway" {
  description = "Nat gateway whether or not use"
  type        = string
  default     = "false"
}

variable "subnets" {
  description = "map of VPC Subnet CIDR"
  type        = map(any)
  default = { }
}

variable "tags" {
  description = "AWS Default Tags"
  type        = map(string)
  default = { }
}