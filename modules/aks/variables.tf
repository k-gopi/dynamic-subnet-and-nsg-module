variable "location" {}
variable "resource_group_name" {}
#variable "aks_subnet_id" {}
#variable "appgw_subnet_id" {}
variable "aks_subnet_id" {
  type        = string
  description = "AKS subnet ID"
  default     = ""
}

variable "appgw_subnet_id" {
  type        = string
  description = "Application Gateway subnet ID"
  default     = ""
}
variable "appgw_private_ip" {}   # NEW: static IP for private AppGW

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

variable "user_nodepool_name" {}
variable "user_nodepool_vm_size" {}
variable "user_nodepool_min" {}
variable "user_nodepool_max" {}
variable "service_cidr" {}
variable "dns_service_ip" {}


variable "tags" {
  type = map(string)
  default = {}
}