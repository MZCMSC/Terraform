# ++++++++++++++++++++++++++++++++++++++++++++++
#                 ELB (ALB type)
# ++++++++++++++++++++++++++++++++++++++++++++++
#                   Front
# ++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_lb" "front_alb" {
  name               = "test-tf-ext-front-alb"
  internal           = false # Public
  load_balancer_type = "application"
  subnets = [
    aws_subnet.main_pub_a_subnet.id,
    aws_subnet.main_pub_c_subnet.id
  ]
  security_groups = [
    aws_security_group.front_alb_sg.id
  ]
  #     depends_on = [ 
  #         aws_lb_target_group.front_alb_tg
  # ]
  # tags = ""

}

# ++++++++++++++++++++++++++++++++++++++++++++++
#                   backend
# ++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_lb" "backend_alb" {
  name               = "test-tf-int-backend-alb"
  internal           = true # Private
  load_balancer_type = "application"
  subnets = [
    aws_subnet.web_pri_a_subnet.id,
    aws_subnet.web_pri_c_subnet.id
  ]
  security_groups = [
    aws_security_group.backend_alb_sg.id
  ]
  # depends_on = [ 
  #     aws_lb_target_group.backend_alb_tg
  # ]

  # tags = ""
}
