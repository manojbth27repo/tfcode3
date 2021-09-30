provider "aws" {
  region = "us-east-1"
}

data "aws_vpc" "vpcid" {
  tags = {
    Name = "school"
  }
}

module "sgmain" {
  source = "./modules/sg"
  vpc_id = data.aws_vpc.vpcid
}

