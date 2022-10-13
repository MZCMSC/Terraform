# ++++++++++++++++++++++++++++++++++++++++++++++
#             ALB Target Group
# ++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_lb_target_group" "front_alb_tg" {
  name        = "test-tf-front-alb-tg"
  vpc_id      = aws_vpc.this.id
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
}
resource "aws_lb_target_group" "backend_alb_tg" {
  name        = "test-tf-backend-alb-tg"
  vpc_id      = aws_vpc.this.id
  target_type = "instance"
  port        = 8080
  protocol    = "HTTP"
}

# ++++++++++++++++++++++++++++++++++++++++++++++
#         ALB Target Group Attachment
# ++++++++++++++++++++++++++++++++++++++++++++++
# Front ALB
resource "aws_lb_target_group_attachment" "front_alb_tg_a_attach" {
  target_group_arn = aws_lb_target_group.front_alb_tg.arn
  port             = 80
  target_id        = aws_instance.web_a.id
}
resource "aws_lb_target_group_attachment" "front_alb_tg_c_attach" {
  target_group_arn = aws_lb_target_group.front_alb_tg.arn
  port             = 80
  target_id        = aws_instance.web_c.id
}

# Backend ALB
resource "aws_lb_target_group_attachment" "backend_alb_tg_a_attach" {
  target_group_arn = aws_lb_target_group.backend_alb_tg.arn
  port             = 8080
  target_id        = aws_instance.was_a.id
}
resource "aws_lb_target_group_attachment" "backend_alb_tg_c_attach" {
  target_group_arn = aws_lb_target_group.backend_alb_tg.arn
  port             = 8080
  target_id        = aws_instance.was_c.id
}