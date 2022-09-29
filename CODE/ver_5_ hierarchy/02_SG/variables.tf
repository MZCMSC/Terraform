variable "region" {
  description = "AWS Region"
  type        = string
  default     = ""
}

variable "prefix" {
  # prd,stg,dev,test
  description = "AWS Prefix"
  type        = string
  default     = ""
}

# variable "sg_name" {
#   description = "Security Group's name"
#   type        = string
#   default     = ""
# }

# variable "sg_name" {
#   description = "Security Group's name"
#   type        = list(string)
#   default     = []
# }

variable "tags" {
  description = "AWS Default Tags"
  type        = map(string)
  default = {}
}

variable "sg_name" {
  description = "Security Group's"
  type = map(string)
  default = {}
}

variable "rules" {
  description = "Security Group's rules"
  type        = map(any)
  default = {}
}