# Default SG Network Disable
resource "aws_default_security_group" "this" {
  vpc_id = aws_vpc.this.id
  
  tags   = tomap({
    Name = format(
        "%s-%s-default-sg", 
        var.prefix, 
        var.vpc_name)
    })
}
