locals {
  description = "name prefix for resources"
  name-prefix = lower("${var.org}-${var.proj}-${var.env}")
}
data "aws_region" "current" {}

module "ec2_instance" {
  for_each = var.ec2
  source = "./ec2_instance"
  ec2 = {
   ec2_name = each.key
   instance_type = each.value.instance_type
   ami_id = each.value.ami_id
   az = "${data.aws_region.current.name}${each.value.az}"
   key_pair_id = each.value.key_pair_id
   kms_key_id = each.value.kms_key_id
   instance_profile_name = each.value.instance_profile_name
   root_disk = each.value.root_disk
   ebs_vols = each.value.ebs_vols
   eni_subnet_id = each.value.eni_subnet_id
   eni_security_groups = each.value.eni_security_groups
   ec2_tags = each.value.ec2_tags
  }
  name-prefix = local.name-prefix
}