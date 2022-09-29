# output "vpc_id" {
#   value = aws_vpc.this.id
# }


output "alb_front_id" {
    value = aws_lb.front_alb.id
}

output "alb_backend_id" {
    value = aws_lb.backend_alb.id
}