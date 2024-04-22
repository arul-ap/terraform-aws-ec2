
output "ec2_id" {
  value = aws_instance.ec2.id
}
output "ebs_id" {
  value = {for k,v in module.ebs: k => v.ebs_id}
}
output "eni_id" {
  value = [for i in module.eni: i.eni_id]
}
