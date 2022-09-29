output "ec2_instances" {
    value = aws_instance.this
}
output "ec2_instance_id" {
    value = {for key, value in aws_instance.this : key => value.id}
}
