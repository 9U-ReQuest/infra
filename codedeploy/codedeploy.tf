# S3 버킷 생성
resource "aws_s3_bucket" "codedeploy" {
  bucket = "request-${terraform.workspace}.codedeploy.bucket"
}

# CodeDeploy 애플리케이션
resource "aws_codedeploy_app" "request" {
  name = "request-${terraform.workspace}"
}

# IAM 역할 - CodeDeploy를 위한 역할
resource "aws_iam_role" "codedeploy" {
  name = "request-${terraform.workspace}.codedeploy.role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "codedeploy.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

# IAM 역할 정책 연결
resource "aws_iam_role_policy_attachment" "codedeploy" {
  role       = aws_iam_role.codedeploy.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
}
