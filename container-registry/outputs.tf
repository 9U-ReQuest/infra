
output "ecr_id" {
  description = "id of the container registry"
  value = aws_ecr_repository.container_registry.id
}