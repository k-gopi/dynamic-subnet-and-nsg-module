#################################
# Public IP for Firewall
#################################

resource "azurerm_public_ip" "firewall_pip" {
  name                = "${var.firewall_name}-pip"
  location            = var.location
  resource_group_name = var.resource_group_name

  allocation_method   = "Static"
  sku                 = "Standard"

  tags = var.tags
}

#################################
# Azure Firewall
#################################

resource "azurerm_firewall" "this" {
  name                = var.firewall_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku_name = "AZFW_VNet"
  sku_tier = "Standard"

  ip_configuration {
    name                 = "firewall-ipconfig"
    subnet_id            = var.firewall_subnet_id
    public_ip_address_id = azurerm_public_ip.firewall_pip.id
  }

  tags = var.tags
}

#################################
# Firewall Application Rule Collection (AKS Outbound)
#################################
resource "azurerm_firewall_application_rule_collection" "aks_outbound" {
  name                = "aks-outbound-rules"
  azure_firewall_name = azurerm_firewall.this.name
  resource_group_name = var.resource_group_name
  priority            = 100
  action              = "Allow"

  rule {
    name = "aks-required-fqdn"

    source_addresses = [
      var.aks_subnet_cidr
    ]

    target_fqdns = [
      "mcr.microsoft.com",
      "*.data.mcr.microsoft.com",
      "management.azure.com",
      "login.microsoftonline.com",
      "packages.microsoft.com",
      "archive.ubuntu.com",
      "security.ubuntu.com",
      "*.hcp.eastus2.azmk8s.io",
      "*.blob.core.windows.net",
      "*.azurecr.io",
      "dc.services.visualstudio.com",
      "*.ods.opinsights.azure.com",
      "*.oms.opinsights.azure.com",
      "*.monitor.azure.com",
      "registry.k8s.io",
      "ghcr.io",
      "ntp.ubuntu.com"
    ]

    protocol {
      port = 80
      type = "Http"
    }

    protocol {
      port = 443
      type = "Https"
    }
  }
}

#################################
# Firewall Network Rule Collection (AKS node egress)
#################################
resource "azurerm_firewall_network_rule_collection" "aks_network" {
  name                = "aks-network-rules"
  azure_firewall_name = azurerm_firewall.this.name
  resource_group_name = var.resource_group_name
  priority            = 200
  action              = "Allow"

  rule {
    name                  = "aks-node-egress"
    source_addresses      = [var.aks_subnet_cidr]
    destination_addresses = ["0.0.0.0/0"]
    destination_ports     = ["443"]
    protocols             = ["TCP"]
  }
}