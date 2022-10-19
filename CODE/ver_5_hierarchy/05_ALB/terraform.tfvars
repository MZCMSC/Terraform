region = "ap-northeast-2"

prefix = "test"

add_alb = {
  front = {
    alb_name           = "front"
    load_balancer_type = "application"
    internal           = false
    subnet_cidr_a      = "10.50.10.0/24"
    subnet_cidr_c      = "10.50.20.0/24"
    target_type     = "instance"
    protocol        = "HTTP"
    port            = 80
    instance_target = ["web_a", "web_c"]
  },
  backend = {
    alb_name           = "backend"
    load_balancer_type = "application"
    internal           = true
    subnet_cidr_a      = "10.50.110.0/24"
    subnet_cidr_c      = "10.50.120.0/24"
    target_type     = "instance"
    protocol        = "HTTP"
    port            = 8080
    instance_target = ["was_a", "was_c"]
  }
}

tags = {
  "CreatedByTerraform" = "True"
  "purpose"            = "Terraform_Test"
  "owner"              = "MSC"
  "resource"           = "ALB"
}




