variable "region" {
  type    = string
  default = "ap-northeast-2"
}

variable "prefix" {
  type    = string
  default = "test"
}

variable "az" {
  description = "Created EC2-Bastion AZ"
  type        = string
  default     = "ap-northeast-2a"
}

# variable "vpc_name" {
#   type    = string
#   default = "tf-vpc"
# }

variable "instance_name" {
  description = "EC2 instance name"
  type        = string
  default     = "bastion"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Key name to use for EC2 instance"
  type        = string
  default     = "tf_test_key"
}

variable "volume_size" {
  description = "The size of the volume in gigabytes"
  type        = number
  default     = 8
}

variable "volume_type" {
  description = "The type of volume (gp2, gp3, io2, standard)"
  type        = string
  default     = "gp2"
}

variable "tags" {
  type = map(string)
  default = {
    "CreatedByTerraform" = "True"
    "purpose"            = "Test"
    "owner"              = "MSC"
    "resource"           = "EC2"
  }
}






# variable "ami_id" {
#   description = "EC2 instance AMI(default : Amazon Linux 2)"
#   type        = string
#   default     = ""
# }

# variable "subnet_cidr" {
#   description = "EC2 Subnet CIDR"
#   type        = string
#   default     = ""
# }
# variable "sg_ingress_rule" {
#   description = "Ingree Security Group rule"
#   type        = list(string)
#   default     = []
# }

# variable "subnet_id" {
#   description = "Bastion subnet"
#   type        = string
#   default     = ""
# }

# variable "vpc_id" {
#   description = "AWS VPC ID"
#   type        = string
#   default     = ""
# }