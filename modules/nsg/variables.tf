variable "subnets" {
  type = map(object({
    cidr = string
  }))
}

variable "resource_group_name" {}
variable "location" {}