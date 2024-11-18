output "vpc_id" {
    description = "id of vpc"
    value = aws_vpc.request.id
}

output "igw_id" {
  description = "id of internet gateway"
  value = aws_internet_gateway.request.id
}

output "public_subnet_id" {
  description = "id of public subnet"
  value = aws_subnet.request_public.id
}

output "private_subnet_id" {
  description = "id of private subnet"
  value = aws_subnet.request_private.id
}

output "public_route_table_id" {
  description = "id of public route table"
  value = aws_route_table.public.id
}

output "private_route_table_id" {
  description = "id of private route table"
  value = aws_route_table.private.id
}