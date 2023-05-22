locals {
  env = var.env
}

resource "aws_vpc" "staging-vpc" {
  cidr_block = "10.1.0.0/16"

  tags = {
    Name = "${local.env}-VPC"
  }
}

resource "aws_subnet" "staging-vpc-subnet" {
  vpc_id     = aws_vpc.staging-vpc.id
  cidr_block = "10.1.0.0/24"

  tags = {
    Name = "${local.env}-VPC"
  }
}

resource "aws_instance" "web" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = var.ec2_instance_type
  subnet_id     = aws_subnet.staging-vpc-subnet.id
  tags = {
    Name = "${local.env}-EC2"
  }
}
