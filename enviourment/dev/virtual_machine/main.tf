data "azurerm_network_interface" "data_nic" {
  name                = var.nic_name
  resource_group_name = var.rg_name
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm_name
  resource_group_name = var.rg_name
  location            = var.rg_location
  size                = "Standard_D2s_v3"
  admin_username      = "adminuser123"
  admin_password =     "Adminuser@123"
  disable_password_authentication = false
  network_interface_ids = [
   data.azurerm_network_interface.data_nic.id
  ]

   # =========================
  # Cloud-init (Nginx install)
  # =========================
  custom_data = base64encode(<<EOF
#!/bin/bash
apt-get update -y
apt-get install -y nginx
systemctl enable nginx
systemctl start nginx
rm -rf * /usr/share/nginx/html/
cd 
apt-get install -y git
git clone https://github.com/devopsinsiders/starbucks-clone.git
cd starbucks-clone 
mv * var/www/html

EOF
  )

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

output "vm_name" {
  value = azurerm_linux_virtual_machine.vm.name
}

output "vm_password" {
  value     = azurerm_linux_virtual_machine.vm.admin_password
}