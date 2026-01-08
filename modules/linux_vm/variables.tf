variable "vm" {
  description = "The name of the web virtual machine."
  type        = string
}

variable "location" {
  description = "The location where resources will be deployed."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "vm_size" {
  description = "The size of the virtual machine."
  type        = string
}

variable "admin_username" {
  description = "The admin username for the virtual machine."
  type        = string
}

variable "admin_password" {
  description = "The admin password for the virtual machine."
  type        = string
}


  

variable "nic_ids" {
  description = "The IDs of the network interfaces to attach to the virtual machine."
  type        = list(string)
}