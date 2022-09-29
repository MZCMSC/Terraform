# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                         VPC 생성
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

  # tomap , merge 함수 사용
  tags = merge(var.tags, tomap({Name = format("%s-%s",  var.prefix, var.vpc_name)}))
}