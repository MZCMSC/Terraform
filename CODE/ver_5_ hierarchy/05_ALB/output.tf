output "alb_ids" {
  # value = aws_lb.this
  value = {for key, value in aws_lb.this : key => value.id}
}

output "alb_tg_ids" {
  # value = aws_lb_target_group.this
  value = {for key, value in aws_lb_target_group.this : key => value.id}
}

output "alb_tg_attach_ids" {
  # value = aws_lb_target_group_attachment.this
  value = {for key, value in aws_lb_target_group_attachment.this : key => value.id}
}