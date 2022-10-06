# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                         VPC 생성
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

  tags = merge(
    var.tags, 
      tomap({
        Name = format(
          "%s-%s",  
          var.prefix, 
          var.vpc_name
      )
    })
  )
}