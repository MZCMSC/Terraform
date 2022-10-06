variable "region" {
  description = "(optional) describe your variable"
  type        = string
  default     = "ap-northeast-2"
}

variable "prefix" {
  # prd,stg,dev,test
  description = "AWS Prefix"
  type        = string
  default     = "test"
}

variable "name" {
  description = "Security Group's name"
  type        = string
  default     = "tf-msc"
}

variable "tags" {
  description = "AWS Default Tags"
  type        = map(string)
  default = {
    "CreatedByTerraform" = "True"
    "purpose"            = "Test"
    "owner"              = "MSC"
    "resource"           = "SG"
  }
}

variable "rules" {
  description = "Security Group's rules"
  type        = map(any)
  default = {
    bastion = {
      name        = "bastion"
      type        = "ingress"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = []
    },
    web = {
      name        = "web"
      type        = "ingress"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = []
    },
    was = {
      name        = "was"
      type        = "ingress"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = []
    },
    rds = {
      name        = "rds"
      type        = "ingress"
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      cidr_blocks = []
    }
    front = {
      name        = "front"
      type        = "ingress"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = []
    }
    backend = {
      name        = "backend"
      type        = "ingress"
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      cidr_blocks = []
    }
  }
}