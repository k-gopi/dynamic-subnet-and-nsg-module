# -----------------------------
# SQL Server
# -----------------------------
resource "azurerm_mssql_server" "this" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.sql_version
  administrator_login          = var.sql_admin_username
  administrator_login_password = var.sql_admin_password
  tags                         = var.tags
  timeouts {
    delete = "5m"
  }
}

# -----------------------------
# Wait 1 Minute After SQL Server Creation
# -----------------------------
resource "time_sleep" "wait_after_sql_server" {
  depends_on      = [azurerm_mssql_server.this]
  create_duration = "60s"  # 1 minute wait
}

# -----------------------------
# SQL Database
# -----------------------------
resource "azurerm_mssql_database" "this" {
  name       = var.database_name
  server_id  = azurerm_mssql_server.this.id
  sku_name   = var.sku_name
  tags       = var.tags
  timeouts {
    delete = "5m"
  }

  depends_on = [
    time_sleep.wait_after_sql_server  # ensures 1 min wait before DB creation
  ]
}