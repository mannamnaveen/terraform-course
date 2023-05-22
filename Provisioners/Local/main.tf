resource "aws_key_pair" "deployer" {
  key_name   = "k-key"
  public_key = var.public_key
}

resource "aws_instance" "web" {
  ami                         = "ami-053b0d53c279acc90"
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.k-subnet1.id
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]
  key_name                    = "k-key"
  associate_public_ip_address = true

  provisioner "local-exec" {
    command = "touch hello-world.txt"
  }

  tags = {
    Name = var.environment
  }
}