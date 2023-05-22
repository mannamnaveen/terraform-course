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

variable "user_names" {
  type        = list(string)
  description = "List of users to be created"
  default     = ["User1", "User2", "User3"]
}
