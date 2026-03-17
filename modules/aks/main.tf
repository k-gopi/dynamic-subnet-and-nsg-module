resource "azurerm_application_gateway" "appgw" {
  name                = var.appgw_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku {
    name     = var.appgw_sku_name
    tier     = var.appgw_sku_tier
    capacity = var.appgw_capacity
  }

  gateway_ip_configuration {
    name      = "appgw-ip-config"
    subnet_id = var.appgw_subnet_id  # Private subnet
  }

  #################################
  # Private Frontend (internal)
  #################################
  frontend_ip_configuration {
    name                         = "private-frontend"
    subnet_id                    = var.appgw_subnet_id
    private_ip_address_allocation = "Static"  # or "Static" if you want fixed IP
    private_ip_address            = var.appgw_private_ip  # ✅ must provide IP
  }

  frontend_port {
    name = "http"
    port = var.appgw_frontend_port
  }

  backend_address_pool {
    name = "dummy-backend"
  }

  backend_http_settings {
    name                  = "dummy-http"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
  }

  http_listener {
    name                           = "dummy-listener"
    frontend_ip_configuration_name = "private-frontend"
    frontend_port_name             = "http"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "dummy-rule"
    rule_type                  = "Basic"
    http_listener_name         = "dummy-listener"
    backend_address_pool_name  = "dummy-backend"
    backend_http_settings_name = "dummy-http"
    priority                   = 100
  }

  tags = var.tags
}
#################################
# AKS Cluster
#################################

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name           = var.system_nodepool_name
    vm_size        = var.system_nodepool_vm_size
    vnet_subnet_id = var.aks_subnet_id

    auto_scaling_enabled = true
    min_count            = var.system_nodepool_min
    max_count            = var.system_nodepool_max

    os_disk_size_gb = var.system_nodepool_os_disk_size_gb
  }

  identity {
    type = "SystemAssigned"
  }

  #################################
  # AKS Networking
  #################################

  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"

    outbound_type = "userDefinedRouting"  #loadBalancer, userDefinedRouting, managedNATGateway, userAssignedNATGateway,none

    service_cidr   = var.service_cidr
    dns_service_ip = var.dns_service_ip
  }

  #################################
  # AGIC Integration
  #################################

  ingress_application_gateway {
    gateway_id = azurerm_application_gateway.appgw.id
  }

  tags = var.tags
}

#################################
# User Node Pool
#################################

resource "azurerm_kubernetes_cluster_node_pool" "userpool" {
  name                  = var.user_nodepool_name
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id

  vm_size        = var.user_nodepool_vm_size
  vnet_subnet_id = var.aks_subnet_id

  auto_scaling_enabled = true
  min_count            = var.user_nodepool_min
  max_count            = var.user_nodepool_max

  os_disk_size_gb = var.user_nodepool_os_disk_size_gb

  mode                   = "User"
  node_public_ip_enabled = false
}