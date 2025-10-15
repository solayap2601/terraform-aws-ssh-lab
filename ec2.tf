terraform {
  required_version = ">= 1.5.7"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

data "aws_vpc" "default" {
  filter {
    name   = "tag:Name"
    values = ["cmtr-g40pyt8i-vpc"]
  }
}

data "aws_security_group" "existing" {
  name   = "cmtr-g40pyt8i-sg"
  vpc_id = data.aws_vpc.default.id
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

resource "aws_instance" "cmtr-g40pyt8i-ec2" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.cmtr-g40pyt8i-keypair.key_name
  vpc_security_group_ids      = [data.aws_security_group.existing.id]
  subnet_id                   = data.aws_subnets.default.ids[0]
  associate_public_ip_address = true

  tags = {
    Name    = "cmtr-g40pyt8i-ec2"
    Project = "epam-tf-lab"
    ID      = "cmtr-g40pyt8i"
  }
}