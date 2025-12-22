output "frontend_subnet" {
  value = azurerm_subnet.frontend_subnet.name
  
}

output "backend_subnet" {
  value = azurerm_subnet.backend_subnet.name
  
}