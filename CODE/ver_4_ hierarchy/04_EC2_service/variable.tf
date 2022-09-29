variable "region" {
  type    = string
  default = "ap-northeast-2"
}

variable "prefix" {
  type    = string
  default = "test"
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

variable "add_instance" {
  description = "EC2 Create map list"
  type        = map(any)
  default = {
    "web_a" = {
      instance_name     = "web"
      ami_id            = "ami-0fd0765afb77bcca7"
      availability_zone = "ap-northeast-2a"
      instance_type     = "t2.micro"
      key_name          = "tf_test_key"
      volume_size       = 8
      volume_type       = "gp2"

      sg_group = "web"
    },
    "web_c" = {
      instance_name     = "web"
      ami_id            = "ami-0fd0765afb77bcca7"
      availability_zone = "ap-northeast-2c"
      instance_type     = "t2.micro"
      key_name          = "tf_test_key"
      volume_size       = 8
      volume_type       = "gp2"

      sg_group = "web"
    },
    "was_a" = {
      instance_name     = "was"
      ami_id            = "ami-0fd0765afb77bcca7"
      availability_zone = "ap-northeast-2a"
      instance_type     = "t2.micro"
      key_name          = "tf_test_key"
      volume_size       = 8
      volume_type       = "gp2"
    },
    "was_c" = {
      instance_name     = "was"
      ami_id            = "ami-0fd0765afb77bcca7"
      availability_zone = "ap-northeast-2c"
      instance_type     = "t2.micro"
      key_name          = "tf_test_key"
      volume_size       = 8
      volume_type       = "gp2"
    }
  }
}