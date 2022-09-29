# ++++++++++++++++++++++++++++++++++++++++++++++
#                   ALB Listener
# ++++++++++++++++++++++++++++++++++++++++++++++
#                     Front
# ++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_lb_listener" "front_alb_listener" {
  load_balancer_arn = aws_lb.front_alb.arn
  port              = var.add_alb.front.port //80
  protocol          = var.add_alb.front.protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.front_alb_tg.arn
  }
  tags = merge(var.tags, tomap({Name = format("%s-tf-%s-listener", var.prefix, var.add_alb.front.name)}))
}

# ++++++++++++++++++++++++++++++++++++++++++++++
#                    Backend
# ++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_lb_listener" "backend_alb_listener" {
  load_balancer_arn = aws_lb.backend_alb.arn
  port              = var.add_alb.backend.port //8080
  protocol          = var.add_alb.backend.protocol


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.backend_alb_tg.arn
  }
  tags = merge(var.tags, tomap({Name = format("%s-tf-%s-listener", var.prefix, var.add_alb.backend.name)}))
}