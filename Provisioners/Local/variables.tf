variable "region" {
  type        = string
  description = "Default Region"
}
variable "environment" {
  type        = string
  description = "Environment details"
  default     = "Development"
}

variable "public_key" {
  type        = string
  description = "The Public Key"
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC1OlSb1cUNnO7BO4khbk6Ts4kGN5kQovE3+c1/nnHS045pPd7021qt+4OhUnrr6KvSiQdMol4SirfaEacWMBndEr1FSYeViWhOcOY6uSy2TJcvoeJic+z4BhGsFF+o+ZgcTo6p8jcb3pwgSwr6jgvAGVO+io3cJqM5vBhdHU9/q+1sNXwNhlJE7bQgPhcyh0aONSOdL5yCnAvUTCY2C5Ap+3o6zV0b99IyHDaZtBOzlCUhr5y74g2rSLq/Re6fJXkHGyZGCi+5faVmtrKmAOW/+okTsizdsKcryq6hXewHCke6OcoTS2MeFpkhVLe4xKKo4aDN9L44P/KevRKtcUFf vagrant@prosrvr"
}

variable "ebs_size" {
  type        = number
  description = "Default EBS Size"
  default     = 10
}

variable "instance_type" {
  type        = string
  description = "Default Instance Type"
}

variable "availability_zones" {
  type        = list(string)
  description = "List of Availability Zones"
}