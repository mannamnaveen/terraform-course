locals {
  instance_name    = "${terraform.workspace}-instance"
  environment_name = "${terraform.workspace}-env"
}

variable "region" {
  type        = string
  description = "Default Region"
}



variable "instance_type" {
  type        = string
  description = "Default Instance Type"
}

variable "availability_zones" {
  type        = list(string)
  description = "List of Availability Zones"
}