output "ec2_id" {
  description = "EC2 ID"
  value = { for k,v in module.ec2_instance: k => v.ec2_id }
}
output "ebs_id" {
  description = "EBS volume ID"
  value = {for k,v in module.ec2_instance: k => v.ebs_id}
}
output "eni_id" {
  description = "ENI ID"
  value = {for k,v in module.ec2_instance: k => v.eni_id}
}
