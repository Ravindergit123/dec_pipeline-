data "azurerm_mssql_server" "data_server" {
  name                = var.sql_server
  resource_group_name = var.rg_name
}


resource "azurerm_mssql_database" "database_sql" {
  name           = var.database_name
  server_id      = data.azurerm_mssql_server.data_server.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 20
  sku_name       = "S1"
  zone_redundant = false
}

# output "database_id" {
#   value = azurerm_mssql_database.database_sql.id
# }

output "database_name" {
  value = azurerm_mssql_database.database_sql.name
}