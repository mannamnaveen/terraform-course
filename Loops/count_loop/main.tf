locals {
  env = var.env
}

resource "aws_vpc" "k-vpc" {
  cidr_block = "10.1.0.0/16"

  tags = {
    Name = "${local.env}-VPC"
  }
}

resource "aws_subnet" "k-vpc-subnet" {
  vpc_id     = aws_vpc.k-vpc.id
  cidr_block = "10.1.0.0/24"

  tags = {
    Name = "${local.env}-VPC"
  }
}

resource "aws_instance" "web" {
  ami                         = "ami-053b0d53c279acc90"
  instance_type               = var.ec2_instance_type
  subnet_id                   = aws_subnet.k-vpc-subnet.id
  associate_public_ip_address = var.need_public_ip
  tags = {
    Name = "${local.env}-EC2"
  }
}

resource "aws_internet_gateway" "k-vpc-igw" {
  vpc_id = aws_vpc.k-vpc.id
  tags = {
    Name = "${local.env}-VPC"
  }
}

resource "aws_iam_user" "k-users" {
  count = length(var.user_names)
  name  = var.user_names[count.index]
}