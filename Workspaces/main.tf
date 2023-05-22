
resource "aws_instance" "web" {
  ami                         = "ami-053b0d53c279acc90"
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.k-subnet1.id
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]
  key_name                    = "mkey"
  associate_public_ip_address = true


  tags = {
    Name = local.instance_name
  }
}