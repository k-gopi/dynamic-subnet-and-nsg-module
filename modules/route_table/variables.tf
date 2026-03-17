variable "route_table_name" {
  type = string
}

variable "route_name" {
  type = string
}

variable "address_prefix" {
  type = string
}

variable "next_hop_type" {
  type = string
}

variable "next_hop_ip" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "aks_subnet_id" {
  type = string
}

variable "db_subnet_cidr" {
  type = string
}

#variable "storage_subnet_cidr" {
 # type = string
#}

variable "tags" {
  type = map(string)
}