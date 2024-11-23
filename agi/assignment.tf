# S3 버킷 생성
resource "aws_s3_bucket" "assignment" {
  bucket = "request-${terraform.workspace}.assignment.bucket"
}