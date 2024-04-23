output "ec2-id" {
  description = "EC2 instance ID"
  value       = module.ec2.ec2_id
}
output "ebs_id" {
  description = "EBS volume ID"
  value       = module.ec2.ebs_id
}
output "eni_id" {
  description = "ENI ID"
  value       = module.ec2.eni_id
}
