module "rg" {
  source      = "../enviourment/dev/resource_group"
  rg_name     = var.rg_name
  rg_location = var.rg_location
}

module "rgvnet" {
  depends_on  = [module.rg]
  source      = "../enviourment/dev/virtual_network"
  vnet_p      = var.vnet_p
  rg_name     = var.rg_name
  rg_location = var.rg_location
}

module "subnet" {
  depends_on      = [module.rgvnet]
  source          = "../enviourment/dev/subnet"
  frontend_subnet = var.frontend_subnet
  backend_subnet  = var.backend_subnet
  ravi_rg         = var.rg_name
  ravi_vnet       = var.vnet_p
}

module "frontend_nic" {
  depends_on  = [module.frontend_pip, module.subnet]
  source      = "../enviourment/dev/nic"
  subnet_name = var.frontend_subnet
  vnet_name   = var.vnet_p
  rg_name     = var.rg_name
  nic_name    = var.frontend_nic
  rg_location = var.rg_location
  pip_name    = var.frontend_pip
}

module "backend_nic" {
  depends_on  = [module.backend_pip, module.subnet]
  source      = "../enviourment/dev/nic"
  subnet_name = var.backend_subnet
  vnet_name   = var.vnet_p
  rg_name     = var.rg_name
  nic_name    = var.backend_nic
  rg_location = var.rg_location
  pip_name    = var.backend_pip
}

module "frontend_nsg" {
  depends_on  = [module.rg]
  source      = "../enviourment/dev/nsg"
  nsg_name    = var.frontend_nsg
  rg_location = var.rg_location
  rg_name     = var.rg_name
}

module "backend_nsg" {
  depends_on  = [module.rg]
  source      = "../enviourment/dev/nsg"
  nsg_name    = var.backend_nsg
  rg_location = var.rg_location
  rg_name     = var.rg_name
}

module "frontend_pip" {
  depends_on  = [module.rg]
  source      = "../enviourment/dev/pubalic_pip"
  pip_name    = var.frontend_pip
  rg_name     = var.rg_name
  rg_location = var.rg_location
}

module "backend_pip" {
  depends_on  = [module.rg]
  source      = "../enviourment/dev/pubalic_pip"
  pip_name    = var.backend_pip
  rg_name     = var.rg_name
  rg_location = var.rg_location
}

module "frontend_vm" {
  depends_on  = [module.frontend_nic, module.rg]
  source      = "../enviourment/dev/virtual_machine"
  vm_name     = var.frontend_vm
  rg_name     = var.rg_name
  rg_location = var.rg_location
  nic_name    = var.frontend_nic
}

module "backend_vm" {
  depends_on  = [module.backend_nic, module.rg]
  source      = "../enviourment/dev/virtual_machine"
  vm_name     = var.backend_vm
  rg_name     = var.rg_name
  rg_location = var.rg_location
  nic_name    = var.backend_nic
}


module "sqlserver" {
  depends_on            = [module.rg]
  source                = "../enviourment/dev/sql_database/azurerm_mssql_server"
  sql_server            = var.sql_server
  rg_name               = var.rg_name
  rg_location           = var.rg_location
  server_login_username = var.server_login_username
  server_login_password = var.server_login_password
}

module "sqldatabase" {
  depends_on    = [module.sqlserver]
  source        = "../enviourment/dev/sql_database/azurerm_mssql_database"
  sql_server    = var.sql_server
  rg_name       = var.rg_name
  database_name = var.database_name
}

module "mssql_firewall" {
  depends_on = [module.sqldatabase, module.sqlserver]
  source     = "../enviourment/dev/sql_database/sql_firewall"
  sql_server = var.sql_server
  rg_name    = var.rg_name
}



module "fronted_nic_nsg_assoc" {
  depends_on = [module.frontend_nic, module.frontend_nsg,module.rg]
  source     = "../enviourment/dev/nic_nsg_assoc"
  nsg_name   = var.frontend_nsg
  nic_name   = var.frontend_nic
  rg_name    = var.rg_name
}

module "backend_nic_nsg_assoc" {
  depends_on = [module.backend_nsg, module.backend_nic]
  source     = "../enviourment/dev/nic_nsg_assoc"
  nsg_name   = var.backend_nsg
  nic_name   = var.backend_nic
  rg_name    = var.rg_name
}



