variable "subnet_id" {
  type = string
}
variable "az" {
  type = string
}
variable "eni_name" {
  type = string
}
variable "security_groups" {
  type = list(string)
}