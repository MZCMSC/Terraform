# locals {
#   all = flatten([
#     for key, value in var.add_alb : {

#       name                  = key
#       alb_name              = value.alb_name
#       load_balancer_type    = value.load_balancer_type
#       internal              = value.internal
#       # target_type           = value.target_type
#       # port                  = value.port
#       # protocol              = value.protocol
#       subnet_cidr_a         = value.subnet_cidr_a
#       # subnet_cidr_b         = value.subnet_cidr_b
#       subnet_cidr_c         = value.subnet_cidr_c
#       # subnet_cidr         = value.subnet_cidr
#     }
#   ])
# }

locals {
  all_alb = flatten([
    for key, value in var.add_alb : {
      name               = key
      alb_name           = value.alb_name
      load_balancer_type = value.load_balancer_type
      internal           = value.internal
      subnet_cidr_a      = value.subnet_cidr_a
      subnet_cidr_c      = value.subnet_cidr_c
    }
  ])
}

locals {
  target_group = flatten([
    for key, value in var.add_alb : {
      name        = key
      alb_name    = value.alb_name
      target_type = value.target_type
      port        = value.port
      protocol    = value.protocol
    }
  ])
}

locals {
  target_group_attach = flatten([
    for key, value in var.add_alb : [
      for item in value.instance_target : {
        name            = key
        alb_name        = value.alb_name
        port            = value.port
        instance_target = item
      }
    ]
  ])
}

locals {
  listener = flatten([
    for key, value in var.add_alb : {
      name     = key
      alb_name = value.alb_name
      port     = value.port
      protocol = value.protocol
    }
  ])
}
