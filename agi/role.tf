# EC2 IAM 역할
resource "aws_iam_role" "agi" {
  name = "request-${terraform.workspace}.agi.role"

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
    Name = "request-${terraform.workspace}.agi.role"
  }
}

# ECR 접근 정책
resource "aws_iam_role_policy" "agi_ecr" {
  name = "request-${terraform.workspace}.agi.role.policy.ecr"
  role = aws_iam_role.agi.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ecr:GetAuthorizationToken",
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:GetRepositoryPolicy",
          "ecr:DescribeRepositories",
          "ecr:ListImages",
          "ecr:DescribeImages",
          "ecr:BatchGetImage",
          "ecr:GetLifecyclePolicy",
          "ecr:GetLifecyclePolicyPreview",
          "ecr:ListTagsForResource",
          "ecr:DescribeImageScanFindings",
          "ecr:InitiateLayerUpload",
          "ecr:UploadLayerPart",
          "ecr:CompleteLayerUpload",
          "ecr:PutImage"
        ]
        Resource = "*"
      }
    ]
  })
}

# CodeDeploy S3 접근 정책
resource "aws_iam_role_policy" "agi_s3" {
  name = "request-${terraform.workspace}.agi.role.policy.s3.codedeploy"
  role = aws_iam_role.agi.id

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
resource "aws_iam_role_policy" "agi_assignment_s3" {
  name = "request-${terraform.workspace}.agi.role.policy.s3.assignment"
  role = aws_iam_role.agi.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:*",
        ]
        Resource = [
          aws_s3_bucket.assignment.arn,
          "${aws_s3_bucket.assignment.arn}/*"
        ]
      }
    ]
  })
}
