variable "region" {
  description = "AWS Region"
  type        = string
  default     = ""
}

variable "prefix" {
  type    = string
  default = ""
}

variable "add_alb" {
  type    = map(any)
  default = {}
}

variable "tags" {
  type    = map(string)
  default = {}
}