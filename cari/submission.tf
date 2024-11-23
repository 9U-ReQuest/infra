# S3 버킷 생성
resource "aws_s3_bucket" "submission" {
  bucket = "request-${terraform.workspace}.submission.bucket"
}