output "aws_instance_ip" {
  value     = aws_instance.web.public_ip
  sensitive = true
}

# output "aws_iam_user" {
#   for_each {
#     value = aws.user_names
#   }
# }