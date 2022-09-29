output "rds_cluster" {
  # value = aws_rds_cluster.this
  value = aws_rds_cluster.this

  sensitive = true
}


# output "rds_cluster_instances" {
#   # value = aws_rds_cluster_instance.this
#   value = aws_rds_cluster_instance.this
# }


output "cluster_parameter_group" {
  value = aws_rds_cluster_parameter_group.this
}
output "cluster_parameter_group_id" {
  # value = aws_rds_cluster_parameter_group.this
  value = { for key, value in aws_rds_cluster_parameter_group.this : key => value.id }
}


output "db_parameter_group" {
  value = aws_db_parameter_group.this
}
output "db_parameter_group_id" {
  value = { for key, value in aws_db_parameter_group.this : key => value.id }
}