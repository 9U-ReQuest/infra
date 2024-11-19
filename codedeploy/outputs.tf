output "bucket_arn" {
  description = "arn of codedeploy s3 bucket"
  value       = aws_s3_bucket.codedeploy.arn
}

output "bucket" {
  description = "name of codedeploy s3 bucket"
  value       = aws_s3_bucket.codedeploy.bucket
}
