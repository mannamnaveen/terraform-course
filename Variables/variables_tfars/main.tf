terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.67.0"
    }
  }
}

provider "aws" {
  profile = "default"
}


resource "aws_instance" "web" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = var.ec2_instance_type

  tags = {
    Name = var.environment_name
  }
}
