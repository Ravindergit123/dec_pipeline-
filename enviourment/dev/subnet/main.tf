resource "azurerm_subnet" "frontend_subnet" {
  name                 = var.frontend_subnet
  resource_group_name  = var.ravi_rg
  virtual_network_name = var.ravi_vnet
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "backend_subnet" {
  name                 = var.backend_subnet
  resource_group_name  = var.ravi_rg
  virtual_network_name = var.ravi_vnet
  address_prefixes     = ["10.0.2.0/24"]
}

