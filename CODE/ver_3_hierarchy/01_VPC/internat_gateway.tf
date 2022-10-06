# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#               Internet G/W 생성 및 VPC 연결
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags   = { Name = "test-tf-vpc-igw" }
}

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#               IGW를 따로 Attach 하는 블럭 코드
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# resource "aws_internet_gateway_attachment" "this" {
#     vpc_id = aws_vpc.this.id
#     internet_gateway_id = aws_internet_gateway.this.id
#     depends_on = [ aws_internet_gateway.this ]
# }


