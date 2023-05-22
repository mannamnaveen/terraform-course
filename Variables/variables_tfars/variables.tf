variable "ec2_instance_type" {
  type        = string
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "environment_name" {
  type        = string
  description = "Environment Name"
}
