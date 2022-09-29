# ++++++++++++++++++++++++++++++++++++++++++++++
#                 ELB (ALB type)
# ++++++++++++++++++++++++++++++++++++++++++++++
#                   Front
# ++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_lb" "front_alb" {
  name               = format("%s-tf-%s", var.prefix, var.add_alb.front.name)
  internal           = false # //Public
  load_balancer_type = "application"

  subnets = [
    data.terraform_remote_state.vpc.outputs.pub_a_subnet_id,
    data.terraform_remote_state.vpc.outputs.pub_c_subnet_id
  ]

  security_groups = [
    data.terraform_remote_state.sg.outputs.alb_front_sg_id
  ]

  # depends_on = [aws_lb_target_group.front_alb_tg]
  tags = merge(var.tags, tomap({Name = format("%s-tf-%s", var.prefix, var.add_alb.front.name)}))
}

# ++++++++++++++++++++++++++++++++++++++++++++++
#                   backend
# ++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_lb" "backend_alb" {
  name               = format("%s-tf-%s", var.prefix, var.add_alb.backend.name)
  internal           = true # //Private
  load_balancer_type = "application"
  subnets = [
    data.terraform_remote_state.vpc.outputs.web_a_subnet_id,
    data.terraform_remote_state.vpc.outputs.web_c_subnet_id
  ]
  security_groups = [
    data.terraform_remote_state.sg.outputs.alb_backend_sg_id
  ]
  # depends_on = [aws_lb_target_group.backend_alb_tg]
  tags = merge(var.tags, tomap({Name = format("%s-tf-%s", var.prefix, var.add_alb.backend.name)}))
}