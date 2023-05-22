output "aws_instance_ip" {
  value     = aws_instance.web.public_ip
  sensitive = true
}

output "print_created_users" {
  value = [for i in aws_iam_user.k-users : i.name]
}