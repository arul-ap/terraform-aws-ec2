
//lookup key name
data "aws_key_pair" "ec2" {
  key_pair_id = var.ec2.key_pair_id
}

locals {
  instance_profile = var.ec2.instance_profile_name == null ? 0 : 1
}

data "aws_iam_instance_profile" "ec2" {
  count = local.instance_profile
  name  = var.ec2.instance_profile_name
}

resource "aws_instance" "ec2" {
  ami                  = var.ec2.ami_id
  instance_type        = var.ec2.instance_type
  key_name             = data.aws_key_pair.ec2.key_name
  iam_instance_profile = var.ec2.instance_profile_name == null ? null : data.aws_iam_instance_profile.ec2[0].arn
  root_block_device {
    encrypted   = true
    kms_key_id  = var.ec2.kms_key_id
    volume_size = var.ec2.root_disk.size
    volume_type = var.ec2.root_disk.type
    tags = {
      Name = "${var.name-prefix}-${var.ec2.ec2_name}-root-vol"
    }
  }
  network_interface {
    network_interface_id = module.eni[0].eni_id
    device_index         = 0
  }
  tags = merge(var.ec2.ec2_tags, {
    Name = "${var.name-prefix}-${var.ec2.ec2_name}"
  })
}

module "ebs" {
  source         = "./modules/ebs"
  for_each       = var.ec2.ebs_vols
  az             = var.ec2.az
  kms_key_id     = var.ec2.kms_key_id
  ebs_size_in_gb = each.value.size
  ebs_type       = each.value.type
  ebs_name       = "${var.name-prefix}-${var.ec2.ec2_name}-${each.key}"
}


resource "aws_volume_attachment" "ec2" {
  for_each    = var.ec2.ebs_vols
  instance_id = aws_instance.ec2.id
  volume_id   = module.ebs[each.key].ebs_id
  device_name = each.value.dev_name
}


module "eni" {
  source          = "./modules/eni"
  count           = length(var.ec2.eni_subnet_id)
  subnet_id       = var.ec2.eni_subnet_id[count.index]
  az              = var.ec2.az
  eni_name        = "${var.name-prefix}-${var.ec2.ec2_name}-${count.index}"
  security_groups = var.ec2.eni_security_groups[count.index]
}

resource "aws_network_interface_attachment" "ec2" {
  count                = length(module.eni) - 1
  instance_id          = aws_instance.ec2.id
  network_interface_id = module.eni[count.index + 1].eni_id
  device_index         = count.index + 1
}
