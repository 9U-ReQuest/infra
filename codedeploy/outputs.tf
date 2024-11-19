
output "name" {
  description = "name of codedeploy app"
  value       = aws_codedeploy_app.request.name
}

output "bucket_arn" {
  description = "arn of codedeploy s3 bucket"
  value       = aws_s3_bucket.codedeploy.arn
}

output "bucket" {
  description = "name of codedeploy s3 bucket"
  value       = aws_s3_bucket.codedeploy.bucket
}

output "gasi_group_name" {
  description = "codedeploy deployment group name of gasi"
  value       = aws_codedeploy_deployment_group.gasi.deployment_group_name
}

output "cari_group_name" {
  description = "codedeploy deployment group name of cari"
  value       = aws_codedeploy_deployment_group.cari.deployment_group_name
}

output "agi_group_name" {
  description = "codedeploy deployment group name of agi"
  value       = aws_codedeploy_deployment_group.agi.deployment_group_name
}
