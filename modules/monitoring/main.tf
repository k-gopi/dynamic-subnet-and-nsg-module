resource "azurerm_log_analytics_workspace" "law" {
  name                = var.log_analytics_workspace_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku               = var.log_analytics_sku
  retention_in_days = var.log_analytics_retention_in_days

  tags = var.tags
}

resource "azurerm_application_insights" "appinsights" {
  name                = var.application_insights_name
  location            = var.location
  resource_group_name = var.resource_group_name

  application_type = var.application_type
  retention_in_days = var.appinsights_retention_in_days
  workspace_id      = azurerm_log_analytics_workspace.law.id

  tags = var.tags
}