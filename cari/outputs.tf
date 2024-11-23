output "private_endpoint" {
  description = "internal endpoint of cari instance"
  value       = aws_instance.cari.private_dns
}

output "submission_bucket" {
  description = "submission bucket name"
  value       = aws_s3_bucket.submission.bucket
}
