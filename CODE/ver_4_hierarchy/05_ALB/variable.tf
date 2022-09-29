variable "region" {
  description = "AWS Region"
  type = string
  default = "ap-northeast-2"
}

variable "prefix" {
  type = string
  default = "test"
}

variable "add_alb" {
  type = map(any)
  default = {
    front = {
      name = "front-alb"
      target_type = "instance"
      port = 80
      protocol = "HTTP"
    },
    backend = {
      name = "backend-alb"
      target_type = "instance"
      port = 8080
      protocol = "HTTP"
    }
  }
}

variable "tags" {
  type = map(string)
  default = {
    "CreatedByTerraform" = "True"
    "purpose"            = "Test"
    "owner"              = "MSC"
    "resource"           = "ALB"
  }
}