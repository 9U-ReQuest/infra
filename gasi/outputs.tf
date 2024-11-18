output "public_ip" {
  description = "public ip address of gasi instance"
  value       = aws_eip.gasi.public_ip
}
