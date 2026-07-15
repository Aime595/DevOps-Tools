terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.52"
    }
  }

  required_version = ">= 1.0"
}

provider "aws" {

  region = var.region
}

data "aws_ssm_parameter" "amzn2_linux" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

resource "aws_vpc" "app-vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = local.common_tags
}

resource "aws_subnet" "public-subnet" {
  vpc_id                  = aws_vpc.app-vpc.id
  cidr_block              = var.subnet_cidr_block
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = local.common_tags
}

resource "aws_internet_gateway" "app-vpc" {
  vpc_id = aws_vpc.app-vpc.id

  tags = local.common_tags
}

# resource aws_internet_gateway_attachment "app-vpc"{
#   internet_gateway_id = aws_internet_gateway.app-vpc.id
#   vpc_id = aws_vpc.app-vpc.id
# }

resource "aws_route_table" "app-vpc" {
  vpc_id = aws_vpc.app-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.app-vpc.id
  }

  tags = local.common_tags
}

resource "aws_route_table_association" "app-vpc" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.app-vpc.id
}

resource "aws_security_group" "app-sg" {
  name        = "app-sg"
  description = "instance firewall"
  vpc_id      = aws_vpc.app-vpc.id

  tags = local.common_tags
}

resource "aws_vpc_security_group_ingress_rule" "allow-all" {
  security_group_id = aws_security_group.app-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_egress_rule" "all" {
  security_group_id = aws_security_group.app-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_instance" "nginx1" {
  ami                         = nonsensitive(data.aws_ssm_parameter.amzn2_linux.value)
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public-subnet.id
  vpc_security_group_ids      = [aws_security_group.app-sg.id]
  user_data_replace_on_change = true

  user_data = templatefile("./userdata/userdata.tftpl",{environment = var.environment, company_name = var.company_name})

  depends_on = [aws_internet_gateway.app-vpc]

  tags = merge(local.common_tags, {Name = local.name_prefix})

}