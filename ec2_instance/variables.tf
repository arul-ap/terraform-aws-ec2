variable "ec2" {
 description = "EC2 instance details"
 type = object({
   ec2_name = string
   instance_type = string
   ami_id = string
   az = string
   key_pair_id = string
   kms_key_id = string
   instance_profile_name = string
   root_disk = object({
    size = number
    type = string
   })
   ebs_vols = map(object({
    dev_name = string
    size = number
    type = string
   }))
   eni_subnet_id = list(string)
   eni_security_groups = list(list(string))
   ec2_tags = map(string)
 })
}

variable "name-prefix" {
  type = string
}
