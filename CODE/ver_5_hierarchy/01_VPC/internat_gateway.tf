resource "aws_internet_gateway" "this" {
  vpc_id = var.enable_internet_gateway == "ture" ? aws_vpc.this.id : ""

  tags   = merge(var.tags,
    tomap({
      Name = format(
        "%s-%s-igw", 
        var.prefix, 
        var.vpc_name)
    })
  )
}
resource "aws_internet_gateway_attachment" "this" {
  internet_gateway_id = aws_internet_gateway.this.id
  vpc_id              = aws_vpc.this.id
}