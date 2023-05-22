variable "ec2_instance_type" {
  type        = string
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "env" {
  type        = string
  description = "Environment Name"
  # default = "Development"
}

variable "need_public_ip" {
  type        = bool
  description = "If needed a public IP"
  default     = true
}

