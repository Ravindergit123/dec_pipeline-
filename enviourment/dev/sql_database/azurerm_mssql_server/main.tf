resource "azurerm_mssql_server" "sqlserver" {
  name                         = var.sql_server
  resource_group_name          = var.rg_name
  location                     = var.rg_location
  version                      = "12.0"
  administrator_login          = var.server_login_username
  administrator_login_password = var.server_login_password

 }

# output "sql_server_id" {
#   value = azurerm_mssql_server.sqlserver.id
# }

output "sql_server_name" {
  description = "SQL Server name"
  value       = azurerm_mssql_server.sqlserver.name
}