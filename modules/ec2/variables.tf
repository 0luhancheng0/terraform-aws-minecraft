variable "namespace" {
  type = string
}

variable "vpc" {
  type = any
}

variable "key_name" {
  type = string
}

variable "security_group_ids" {
  type = list
}

variable "volume_size" {
  type = number
}
