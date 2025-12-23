variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "subnet_cidr" {
  type = string
}

variable "pods_cidr" {
  type = string
}

variable "services_cidr" {
  type = string
}

variable "cluster_name" {
  type = string
}
variable "secondary_range_name" {
  type = string
}

variable "secondary_range_name_services" {
  type = string
}

variable "enabled" {
  type    = bool
  default = true
}
variable "enable_cluster"{
  type    = bool
  default = true
}

