# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                      Internet G/W 생성
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags   = merge(var.tags, tomap({ Name = format("%s-%s-igw", var.prefix, var.vpc_name)}))
  # tags   = { Name = "test-tf-vpc-igw" }
}