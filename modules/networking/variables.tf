variable "namespace" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "vpc_private_subnets" {
  type = list
}

variable "vpc_public_subnets" {
  type = list
}

# variable "minecraft_port" {
#   type = string
# }
