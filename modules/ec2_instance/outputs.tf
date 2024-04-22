
output "ec2_id" {
  description = "EC2 instance ID"
  value = aws_instance.ec2.id
}
output "ebs_id" {
  description = "EBS volume ID"
  value = {for k,v in module.ebs: k => v.ebs_id}
}
output "eni_id" {
  description = "ENI ID"
  value = [for i in module.eni: i.eni_id]
}
