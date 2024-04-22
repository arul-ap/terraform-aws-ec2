
output "eni_id" {
  description = "ENI ID"
  value = aws_network_interface.ec2.id
}
