resource "aws_lb_listener" "this" {
  for_each = { for i in local.listener : i.name => i }

  load_balancer_arn = aws_lb.this[each.value.name].id # //.arn
  port              = each.value.port
  protocol          = each.value.protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this[each.value.name].id # //.arn
  }

  tags = merge(var.tags, tomap({ Name = format("%s-tf-%s-listener", var.prefix, each.value.alb_name) }))
}