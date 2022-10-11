# ++++++++++++++++++++++++++++++++++++++++++++++
#                   ALB Listener
# ++++++++++++++++++++++++++++++++++++++++++++++
# Front
resource "aws_lb_listener" "front_alb_listener" {
  load_balancer_arn = aws_lb.front_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.front_alb_tg.arn
  }
  tags = { Name = "test-tf-vpc-front-alb-listener" }
}

# Backend
resource "aws_lb_listener" "backend_alb_listener" {
  load_balancer_arn = aws_lb.backend_alb.arn
  port              = 8080
  protocol          = "HTTP"


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.backend_alb_tg.arn
  }
  tags = { Name = "test-tf-vpc-backend-alb-listener" }
}
