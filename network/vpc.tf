# VPC 설정
resource "aws_vpc" "request" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name    = "request-${terraform.workspace}.vpc"
    channel = "${terraform.workspace}"
  }
}

# 인터넷 게이트웨이 생성
resource "aws_internet_gateway" "request" {
  vpc_id = aws_vpc.request.id
  tags = {
    Name    = "request-${terraform.workspace}.igw"
    channel = "${terraform.workspace}"
  }
}

