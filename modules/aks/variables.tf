variable "location" {}
variable "resource_group_name" {}

variable "aks_subnet_id" {
  type = string
}

variable "appgw_subnet_id" {
  type = string
}

variable "appgw_private_ip" {}

variable "appgw_name" {}
variable "appgw_sku_name" {}
variable "appgw_sku_tier" {}
variable "appgw_capacity" {}
variable "appgw_frontend_port" {}

variable "aks_cluster_name" {}
variable "dns_prefix" {}

variable "system_nodepool_name" {}
variable "system_nodepool_vm_size" {}
variable "system_nodepool_min" {}
variable "system_nodepool_max" {}

variable "system_nodepool_os_disk_size_gb" {
  type = number
}

variable "user_nodepool_name" {}
variable "user_nodepool_vm_size" {}
variable "user_nodepool_min" {}
variable "user_nodepool_max" {}

variable "user_nodepool_os_disk_size_gb" {
  type = number
}

variable "service_cidr" {}
variable "dns_service_ip" {}

variable "tags" {
  type = map(string)
  default = {}
}