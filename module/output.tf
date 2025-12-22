
output "rg_name" {
  value = module.rg.rg_name
}

output "rg_location" {
  value = module.rg.rg_location
}

output "vnet_p" {
  value = module.rgvnet.vnet_p
}

output "frontend_subnet" {
  value = module.subnet.frontend_subnet
  
}
output "backend_subnet" {
  
  value = module.subnet.backend_subnet
}

# output "nic_name" {
#   value = module.frontend_nic.frontend_nic
# }

# output "nsg_name" {
#   value = module.frontend_nsg.frontend_nsg
  
# }

# output "nsg_name" {
#   value = module.backend_nsg.backend_nsg
  
# }

# VMs
output "frontend_vm_name" {
  value       = try(module.frontend_vm.vm_id, module.frontend_vm.virtual_machine_id, module.frontend_vm.vm_name, null)
}

output "backend_vm_name" {
  value       = try(module.backend_vm.vm_id, module.backend_vm.virtual_machine_id, module.backend_vm.vm_name, null)
}


# NICs
output "frontend_nic_name" {
  value       = try(module.frontend_nic.nic_id, module.frontend_nic.network_interface_id, module.frontend_nic.nic_name, null)
}

output "backend_nic_name" {
  value       = try(module.backend_nic.nic_id, module.backend_nic.network_interface_id, module.backend_nic.nic_name, null)
}

# NSGs
output "frontend_nsg_name" {
  value       = try(module.frontend_nsg.nsg_id, module.frontend_nsg.nsg_name, null)
}

output "backend_nsg_name" {
  value       = try(module.backend_nsg.nsg_id, module.backend_nsg.nsg_name, null)
}

# Public IPs (PIP)
output "frontend_pip_name" {
  value       = try(module.frontend_pip.pip_id, module.frontend_pip.public_ip_id, module.frontend_pip.pip_name, null)
}

output "backend_pip_name" {
  value       = try(module.backend_pip.pip_id, module.backend_pip.public_ip_id, module.backend_pip.pip_name, null)
}



# SQL Server & Database

output "sql_database_name" {
  value       = try(module.sqldatabase.database_id, module.sqldatabase.db_id, module.sqldatabase.database_name, null)
}

output "sql_server_name" {
  
  value       = try(module.sqlserver.sql_server_name, module.sqlserver.sql_server, null)
}

# VM ip details

output "frontend_vm_public_ip" {
  value       = module.frontend_pip.pip_ip
}

output "backend_vm_public_ip" {
  value       = module.backend_pip.pip_ip
}

# VM PASSWORD OUTPUT
# -------------------------

output "frontend_vm_password" {
  value       = module.frontend_vm.vm_password
  sensitive = true

}

output "backend_vm_password" {
  value       = module.backend_vm.vm_password
  sensitive = true
  
}
