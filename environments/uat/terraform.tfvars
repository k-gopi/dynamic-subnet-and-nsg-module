# -----------------------------
# Resource Group related values
# -----------------------------

project     = "fis"        # RG name build cheyyadaniki use avutundi (fis-uat-rg)
environment = "uat"        # Environment identify cheyyadaniki (dev/uat/prod)
location    = "East US"    # RG create ayye Azure region


# -----------------------------
# VNET related values
# -----------------------------

vnet_name = "fis-uat-vnet"     # Virtual Network name

vnet_address_space = [
  "10.0.0.0/16"                # VNET CIDR range
]

dns_servers = []               # Custom DNS servers (empty ante Azure default DNS use avutundi)


# -----------------------------
# SUBNET related values
# (Diagram lo unna subnets)
# -----------------------------

subnets = {

  # Application Gateway subnet
  # Azure Application Gateway deploy avvadaniki use avutundi
  app_gateway = {
    name           = "appgw-subnet"
    address_prefix = "10.0.1.0/24"
  }

  # AKS subnet
  # AKS nodes and pods run avvadaniki use avutundi
  aks = {
    name           = "aks-subnet"
    address_prefix = "10.0.2.0/24"
  }

  # Private Endpoint subnet
  # Azure SQL, Storage private endpoints kosam use avutundi
  private_endpoint = {
    name           = "private-endpoint-subnet"
    address_prefix = "10.0.3.0/24"
  }

}

#############################################
# Monitoring Resources
#############################################

log_analytics_workspace_name = "uad-law"
application_insights_name    = "uad-appinsights"

#############################################
# storage Resources
#############################################

storage_account_name = "uadstorage123"
container_name       = "appdata"

# -----------------------------
# Common tags (ALL resources)
# RG + VNET + future resources
# -----------------------------

tags = {
  Project     = "fis"          # Project name
  Environment = "uat"          # Environment
  ManagedBy   = "Terraform"    # Resource create chesindi Terraform ani denote chestundi
  Owner       = "Gopi"         # Resource owner
  CostCenter  = "12345"        # Billing / finance tracking
}