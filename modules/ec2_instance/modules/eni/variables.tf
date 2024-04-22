variable "subnet_id" {
  description = "Subnet ID for ENI"
  type        = string
}
variable "az" {
  description = "Availability Zone"
  type        = string
}
variable "eni_name" {
  description = "ENI name"
  type        = string
}
variable "security_groups" {
  description = "Security Groups for ENI"
  type        = list(string)
}
