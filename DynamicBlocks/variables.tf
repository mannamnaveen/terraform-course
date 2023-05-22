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
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCvjrsVDU5nZrnlOvB7LKm2ePCibmK3J7dJBGfpukZAkySXW7tqeqsPorHram/8vbraowU9zcc0uNiTM6m39pDeGps6s33lz07oRQcHdSrT430GIIQ8gVMoU+6AxWO1LzkmgNLmqkS2+snURdSPje9QwCjVap5y1BlHT4OpukAihJjJW3VfoyeT8jqFjcSLzZX+a/aU3pj43MGmKdGEynG78tegHrUrVCyhUZC3oZDQWddBgNSfeneXbaYJsoyd05Ku4z6/1Ss7DIWXgPNB5t+t1Sdmiqp079RaCpMk0XEOD0unNQhTUU4RGkbZC0b2YPIQCdVU0kGNh39XD+dn0KBP vagrant@prosrvr"
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