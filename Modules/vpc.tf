locals {
  ingress_rules = [
    {
      port        = 8080
      description = "Ingress rule for port 8080"
    },
    {
      port        = 22
      description = "Ingress rule for port 22"
    }
  ]
}

resource "aws_vpc" "k-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = var.environment
  }
}

resource "aws_subnet" "k-subnet1" {
  vpc_id            = aws_vpc.k-vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = var.availability_zones[0]

  tags = {
    Name = var.environment
  }
}

resource "aws_subnet" "k-subnet2" {
  vpc_id            = aws_vpc.k-vpc.id
  availability_zone = var.availability_zones[1]
  cidr_block        = "10.0.2.0/24"

  tags = {
    Name = var.environment
  }
}

resource "aws_internet_gateway" "k-gw" {
  vpc_id = aws_vpc.k-vpc.id

  tags = {
    Name = var.environment
  }
}

resource "aws_route_table" "k-route" {
  vpc_id = aws_vpc.k-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.k-gw.id
  }
}

resource "aws_route_table_association" "k-rta1" {
  subnet_id      = aws_subnet.k-subnet1.id
  route_table_id = aws_route_table.k-route.id
}

resource "aws_route_table_association" "k-rta2" {
  subnet_id      = aws_subnet.k-subnet2.id
  route_table_id = aws_route_table.k-route.id
}

resource "aws_security_group" "allow_ssh" {
  vpc_id      = aws_vpc.k-vpc.id
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  dynamic "ingress" {
    for_each = local.ingress_rules
    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = ["138.199.35.107/32"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Rule = "allow_ssh"
    Name = var.environment
  }
}