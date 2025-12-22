resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = var.rg_location
  resource_group_name = var.rg_name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# output "nsg_id" {
#   value = azurerm_network_security_group.nsg.id
#   description = "NSG id"
# }

output "nsg_name" {
  value = azurerm_network_security_group.nsg.name
  description = "NSG name"
}
  
