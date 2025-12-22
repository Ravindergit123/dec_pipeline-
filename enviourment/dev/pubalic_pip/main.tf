resource "azurerm_public_ip" "pubalic" {
  name                = var.pip_name
  resource_group_name = var.rg_name
  location            = var.rg_location
  allocation_method   = "Static"
}


# output "pip_id" {
#   value = azurerm_public_ip.pubalic.id
#   description = "Public IP id"
# }

output "pip_name" {
  value = azurerm_public_ip.pubalic.name
}

output "pip_ip" {
  value = azurerm_public_ip.pubalic.ip_address
}