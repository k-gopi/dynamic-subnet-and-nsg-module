variable "firewall_name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "firewall_subnet_id" {
  type = string
}

variable "aks_subnet_cidr" {
  type = string
}

variable "tags" {
  type = map(string)
}