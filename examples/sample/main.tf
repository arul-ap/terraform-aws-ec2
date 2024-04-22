
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  default_tags {
    tags = var.default_tags
  }
}



module "ec2" {
  source = "arul-ap/ec2/aws"

  org = "abc"
  proj = "x"
  env = "dev"

  ec2 = { 
    web-01 = {
      instance_type = "t2.micro"
      ami_id = "ami-0910e4162f162c238"
      az = "a"
      key_pair_id = module.ec2_key_pair.key_pair["ec2-ssh-key"].key_pair_id
      kms_key_id = null
      instance_profile_name = ""
      root_disk = {
        size = 8
        type = "gp2"
      }
      ebs_vols = {
        vol1 = {
            dev_name = "/dev/xvdb"
            size = 1
            type = "gp2"
        }
      }
      eni_subnet_id = [module.vpc.public_subnet_id["web-subnet-01"]]
      eni_security_groups = [[module.vpc.sg_id["web-sg"]]]
      ec2_tags = {
        Description = "Test VM"
      }
  }
    web-02 = {
    instance_type = "t2.micro"
    ami_id = "ami-0910e4162f162c238"
    az = "b"
    key_pair_id = module.ec2_key_pair.key_pair["ec2-ssh-key"].key_pair_id
    kms_key_id = null
    instance_profile_name = ""
    root_disk = {
    size = 8
    type = "gp2"
    }
    ebs_vols = {
    vol1 = {
        dev_name = "/dev/xvdb"
        size = 2
        type = "gp2"
    }
    }
    eni_subnet_id = [module.vpc.public_subnet_id["web-subnet-02"]]
    eni_security_groups = [[module.vpc.sg_id["web-sg"]]]
    ec2_tags = {
      Description = "Test VM"
    }
  }
  }
}

