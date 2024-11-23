# EC2 IAM 역할
resource "aws_iam_role" "gasi" {
  name = "request-${terraform.workspace}.gasi.role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
  tags = {
    Name = "request-${terraform.workspace}.gasi.role"
  }
}

# ECR 접근 정책
resource "aws_iam_role_policy" "gasi_ecr" {
  name = "request-${terraform.workspace}.gasi.role.policy.ecr"
  role = aws_iam_role.gasi.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ecr:GetAuthorizationToken",
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage"
        ]
        Resource = "*"
      }
    ]
  })
}

# S3 접근 정책
resource "aws_iam_role_policy" "gasi_s3" {
  name = "request-${terraform.workspace}.gasi.role.policy.s3.codedeploy"
  role = aws_iam_role.gasi.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:ListBucket"
        ]
        Resource = ["*"]
      }
    ]
  })
}
