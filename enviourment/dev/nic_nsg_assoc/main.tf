data "azurerm_network_interface" "data_nic" {
  name                = var.nic_name
  resource_group_name = var.rg_name
}

data "azurerm_network_security_group" "data_nsg" {
  name                = var.nsg_name
  resource_group_name = var.rg_name
}



resource "azurerm_network_interface_security_group_association" "nic_nsg_assoc" {
  network_interface_id      = data.azurerm_network_interface.data_nic.id
  network_security_group_id = data.azurerm_network_security_group.data_nsg.id
}