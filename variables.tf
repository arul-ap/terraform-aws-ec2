variable "org" {
  description = "Organization code to inlcude in resource names"
  type        = string
}
variable "proj" {
  description = "Project code to include in resource names"
  type        = string
}
variable "env" {
  description = "Environment name to include in resource names"
  type        = string
}
variable "ec2" {
  description = "Map of EC2 instances"
  type = map(object({
    instance_type         = string
    ami_id                = string
    az                    = string
    key_pair_id           = string
    kms_key_id            = optional(string, null)
    instance_profile_name = optional(string, null)
    root_disk = object({
      size = number
      type = string
    })
    ebs_vols = map(object({
      dev_name = string
      size     = number
      type     = string
    }))
    eni_subnet_id       = list(string)
    eni_security_groups = optional(list(list(string)), [[]])
    ec2_tags            = map(string)
  }))
}
