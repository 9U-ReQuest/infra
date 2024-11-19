# ECR 리포지토리 생성
resource "aws_ecr_repository" "container_registry" {
  name = "request-${terraform.workspace}"

  tags = {
    Name = "request-${terraform.workspace}.ecr"
  }
}
