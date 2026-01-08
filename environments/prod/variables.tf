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
    vm_size        = string
    admin_username = string
    }))
}