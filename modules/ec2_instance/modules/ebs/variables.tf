variable "az" {
  description = "Availability Zone"
  type        = string
}

variable "ebs_size_in_gb" {
  description = "EBS volume size in GB"
  type        = number
}

variable "ebs_type" {
  description = "EBS volume type"
  type        = string
}

variable "ebs_name" {
  description = "EBS volume name"
  type        = string
}
variable "kms_key_id" {
  description = "KMS Key ID for EBS encryption"
  type        = string
}
