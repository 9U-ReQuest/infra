# EC2 IAM 역할
resource "aws_iam_role" "cari" {
  name = "request-${terraform.workspace}.cari.role"

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
    Name = "request-${terraform.workspace}.cari.role"
  }
}

# ECR 접근 정책
resource "aws_iam_role_policy" "cari_ecr" {
  name = "request-${terraform.workspace}.cari.role.policy.ecr"
  role = aws_iam_role.cari.id

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
resource "aws_iam_role_policy" "cari_s3" {
  name = "request-${terraform.workspace}.cari.role.policy.s3.codedeploy"
  role = aws_iam_role.cari.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:ListBucket"
        ]
        Resource = [
          data.terraform_remote_state.codedeploy.outputs.bucket_arn,
          "${data.terraform_remote_state.codedeploy.outputs.bucket_arn}/*"
        ]
      }
    ]
  })
}

# Assignment S3 접근 정책
resource "aws_iam_role_policy" "cari_assignment_s3" {
  name = "request-${terraform.workspace}.cari.role.policy.s3.assignment"
  role = aws_iam_role.cari.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:*",
        ]
        Resource = [
          data.terraform_remote_state.codedeploy.outputs.bucket_arn,
          "${data.terraform_remote_state.codedeploy.outputs.bucket_arn}/*"
        ]
      }
    ]
  })
}
