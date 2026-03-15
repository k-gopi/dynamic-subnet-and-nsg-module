variable "route_table_name" {
  description = "Name of the Route Table"
  type        = string
}

variable "route_name" {
  description = "Route name inside the route table"
  type        = string
}

variable "address_prefix" {
  description = "Destination address prefix for the route"
  type        = string
}

variable "next_hop_type" {
  description = "Next hop type (VirtualAppliance, Internet, VnetLocal, None)"
  type        = string
}

variable "next_hop_ip" {
  description = <<EOT
IP of OnPrem firewall or NVA.
Only required if next_hop_type is 'VirtualAppliance'.
Leave empty if not using a VirtualAppliance.
EOT
  type    = string
  default = ""
}

variable "location" {
  description = "Azure region for the route table"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group where the route table will be created"
  type        = string
}

variable "aks_subnet_id" {
  description = "Subnet ID to associate with the route table"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the route table"
  type        = map(string)
  default     = {}
}