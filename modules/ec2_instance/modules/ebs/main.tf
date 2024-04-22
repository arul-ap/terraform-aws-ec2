

resource "aws_ebs_volume" "ec2" {
  availability_zone = var.az
  size              = var.ebs_size_in_gb
  type              = var.ebs_type
  encrypted         = true
  tags = {
    Name = var.ebs_name
  }
}
