output "front_alb_id" {
  value = aws_lb.front_alb.id
  # value = aws_lb.front_alb.arn
}

output "backend_alb_id" {
  value = aws_lb.backend_alb.id
}
