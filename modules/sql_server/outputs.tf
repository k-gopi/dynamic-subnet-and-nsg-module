output "sql_server_id" {
  description = "ID of the SQL Server"
  value       = azurerm_mssql_server.this.id
}

output "database_id" {
  description = "ID of the SQL Database"
  value       = azurerm_mssql_database.this.id
}