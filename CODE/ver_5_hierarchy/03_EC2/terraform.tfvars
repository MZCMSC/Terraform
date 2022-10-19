region = "ap-northeast-2"

prefix = "test"

tags = {
  "CreatedByTerraform" = "True"
  "purpose"            = "Terraform_Test"
  "owner"              = "MSC"
  "resource"           = "EC2"
}

add_instance = {
  "bastion" = {
    instance_name     = "bastion"
    availability_zone = "ap-northeast-2a"
    instance_type     = "t2.micro"
    key_name          = "tf_test_key"
    security_groups   = "bastion"
    subnet_id         = "10.50.10.0/24"
    volume_size       = 8
    volume_type       = "gp2"
    eip               = true
  },
  "web_a" = {
    instance_name     = "web"
    availability_zone = "ap-northeast-2a"
    instance_type     = "t2.micro"
    key_name          = "tf_test_key"
    security_groups   = "web"
    subnet_id         = "10.50.110.0/24"
    volume_size       = 8
    volume_type       = "gp2"
    eip               = false
  },
  "web_c" = {
    instance_name     = "web"
    availability_zone = "ap-northeast-2c"
    instance_type     = "t2.micro"
    key_name          = "tf_test_key"
    security_groups   = "web"
    subnet_id         = "10.50.120.0/24"
    volume_size       = 8
    volume_type       = "gp2"
    eip               = false
  },
  "was_a" = {
    instance_name     = "was"
    availability_zone = "ap-northeast-2a"
    instance_type     = "t2.micro"
    key_name          = "tf_test_key"
    security_groups   = "was"
    subnet_id         = "10.50.130.0/24"
    volume_size       = 8
    volume_type       = "gp2"
    eip               = false
  },
  "was_c" = {
    instance_name     = "was"
    availability_zone = "ap-northeast-2c"
    instance_type     = "t2.micro"
    key_name          = "tf_test_key"
    security_groups   = "was"
    subnet_id         = "10.50.140.0/24"
    volume_size       = 8
    volume_type       = "gp2"
    eip               = false
  },
}
