output "ebs_id" {
  description = "EBS volume ID"
  value       = aws_ebs_volume.ec2.id
}
