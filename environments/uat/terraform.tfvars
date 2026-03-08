#rg
project     = "fis"
environment = "uat"
location    = "eastus"
#vnet
vnet_address_space = ["10.10.0.0/16"]

#subnet

subnets = {
  aks = {
    name             = "fis-uat-aks-subnet"
    address_prefixes = ["10.10.1.0/24"]
  }

  appgw = {
    name             = "fis-uat-appgw-subnet"
    address_prefixes = ["10.10.2.0/24"]
  }

  private_endpoint = {
    name             = "fis-uat-pe-subnet"
    address_prefixes = ["10.10.3.0/24"]
  }
}