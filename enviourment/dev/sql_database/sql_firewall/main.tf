data "azurerm_mssql_server" "data_server" {
  name                = var.sql_server
  resource_group_name = var.rg_name
}

resource "azurerm_mssql_firewall_rule" "sql_firewall" {
  name             = "FirewallRule1"
  server_id        = data.azurerm_mssql_server.data_server.id
  start_ip_address = "223.181.32.136"
  end_ip_address   = "223.181.32.136"
}