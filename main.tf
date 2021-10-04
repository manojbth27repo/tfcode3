provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "vpc_id" {
  cidr_block = var.cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true
}

resource "aws_subnet" "public" {
  cidr_block = var.public_subnet_cidr_block
  vpc_id = aws_vpc.vpc_id.id
  availability_zone_id = "use1-az1"
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "gw_id" {
  vpc_id = aws_vpc.vpc_id.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc_id.id
}

resource "aws_route" "public" {
  route_table_id = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.gw_id.id
}

resource "aws_security_group" "internal" {
  name = "jumpbox"
  vpc_id = aws_vpc.vpc_id.id

  ingress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
