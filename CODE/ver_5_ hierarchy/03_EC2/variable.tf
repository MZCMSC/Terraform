variable "region" {
  type    = string
  default = ""
}

variable "prefix" {
  type    = string
  default = ""
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "add_instance" {
  type    = map(any)
  default = {}
}