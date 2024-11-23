output "private_endpoint" {
  description = "internal endpoint of agi instance"
  value       = aws_instance.agi.private_dns
}

output "assignment_bucket" {
  description = "assignment bucket name"
  value       = aws_s3_bucket.assignment.bucket
}
