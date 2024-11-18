# VPC 설정
resource "aws_vpc" "request" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "request/${terraform.workspace}.vpc"
    channel = "${terraform.workspace}"
  }
}

# 인터넷 게이트웨이 생성
resource "aws_internet_gateway" "request" {
  vpc_id = aws_vpc.request.id
  tags = {
    Name = "request/${terraform.workspace}.igw"
    channel = "${terraform.workspace}"
  }
}

# 퍼블릭 서브넷 생성
resource "aws_subnet" "request_public" {
  vpc_id            = aws_vpc.request.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "request/${terraform.workspace}.subnet.public"
    channel = "${terraform.workspace}"
  }
}
# 프라이빗 서브넷 생성
resource "aws_subnet" "request_private" {
  vpc_id            = aws_vpc.request.id
  cidr_block        = "10.0.101.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "request/${terraform.workspace}.subnet.private"
    channel = "${terraform.workspace}"
  }
}

# 퍼블릭 서브넷 라우팅 테이블 생성 및 인터넷 트래픽 라우팅
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.request.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.request.id
  }

  tags = {
    Name = "request/${terraform.workspace}.rtb.public"
    channel = "${terraform.workspace}"
  }
}

# 퍼블릭 서브넷을 라우팅 테이블에 연결
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.request_public.id
  route_table_id = aws_route_table.public.id
}

# 프라이빗 서브넷 라우팅 테이블 생성
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.request.id
  tags = {
    Name = "reqest/${terraform.workspace}.rtb.private"
    channel = "${terraform.workspace}"
  }
}

# 프라이빗 서브넷을 라우팅 테이블에 연결
resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.request_private.id
  route_table_id = aws_route_table.private.id
}