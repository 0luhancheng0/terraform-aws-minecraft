# variable "private_key" {
#   type = string
#   default = "~/.ssh/aws"
# }

variable "region" {
  type = string
  default = "ap-southeast-2"
}

variable "namespace" {
  type = string
  default = "Sample"
}

variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "vpc_private_subnets" {
  type = list
  default = ["10.0.1.0/24"]
}

variable "vpc_public_subnets" {
  type = list
  default = ["10.0.101.0/24"]
}

variable "volume_size" {
  type = number
  default = 30
}

variable "domain" {
  type = string
  default = ""
}