variable "rg" {
  type = map(object({
    name     = string
    location = string
  }))
}

variable "vnet" {
  type = map(object({
    name          = string
    address_space = list(string)
    location      = string

  }))
}

variable "subnet" {
  type = map(object({
    name             = string
    address_prefixes = list(string)
    vnet_key         = string
    rg_key           = string
  }))
}

variable "nsg" {
  type = map(object({
    name     = string
    location = string
    rg_key   = string
  }))
}

variable "nsg_association" {
  type = map(object({
    nsg_key    = string
    subnet_key = string
  }))
}

variable "pip" {
  type = map(object({
    name              = string
    location          = string
    rg_key            = string
    allocation_method = string
    sku               = string
  }))
}


variable "nics" {
  type = map(object({
    name       = string
    location   = string
    rg_key     = string
    subnet_key = string
  }))
}


variable "vms" {
  type = map(object({
    vm       = string
    location = string
    rg_key   = string
    nics_key = string


    vm_size = string
    # admin_username = string

  }))
}

variable "mysql" {
  type = map(object({
    sql_server_name     = string
    resource_group_name = string
    location            = string
    # sql_admin_username  = string
    # sql_admin_password  = string
  }))
}

variable "sql_database" {
  type = map(object({
    sql_db_name = string
    server_key  = string
    max_size_gb = number

  }))
}








