resource "azurerm_resource_group" "rg" {
  name     = "${var.project}-${var.environment}-rg"
  location = var.location

  tags = {
    Project     = var.project
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}