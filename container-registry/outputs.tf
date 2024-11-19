
output "id" {
  description = "id of the container registry resource"
  value = aws_ecr_repository.container_registry.id
}

output "registry_id" {
  description = "id of the container registry"
  value = aws_ecr_repository.container_registry.registry_id
}

output "repository_url" {
  description = "url of repository"
  value = aws_ecr_repository.container_registry.repository_url
}