
data "aws_subnet" "eni" {
  id = var.subnet_id
  availability_zone = var.az
}

resource "aws_network_interface" "ec2" {
  subnet_id = data.aws_subnet.eni != null ? var.subnet_id : null
  security_groups = var.security_groups
  tags = {
    Name = var.eni_name
  }
}
