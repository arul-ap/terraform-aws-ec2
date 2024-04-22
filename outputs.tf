output "ec2_id" {
  value = { for k,v in module.ec2_instance: k => v.ec2_id }
}
output "ebs_id" {
  value = {for k,v in module.ec2_instance: k => v.ebs_id}
}
output "eni_id" {
  value = {for k,v in module.ec2_instance: k => v.eni_id}
}
