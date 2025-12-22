variable "rg_name" {
  default = "ravinder-rg"
}

variable "rg_location" {
  default = "North Europe"
}

variable "vnet_p" {
  default = "ravi_vnet"
}

#############################

variable "frontend_subnet" {
  default = "frontend"
}

variable "backend_subnet" {
  default = "backend"
}
#############################

variable "frontend_nic" {
  default = "frontendnic"
}

variable "backend_nic" {
  default = "backendnic"
}

variable "frontend_nsg" {
  default = "frontendnsg"
}

variable "backend_nsg" {
  default = "backendnsg"
}


variable "frontend_pip" {
  default = "frontendpip"
}

variable "backend_pip" {
  default = "backendpip"
}


variable "frontend_vm" {
  default = "frontendvm"
}

variable "backend_vm" {
  default = "backendvm"
}

variable "sql_server" {
  default = "raviserver21"
}

variable "server_login_username" {
  default = "raviserver"

}

variable "server_login_password" {
  default = "Ravinder@12345"
}

variable "database_name" {
  default = "ravidatabase"

}
