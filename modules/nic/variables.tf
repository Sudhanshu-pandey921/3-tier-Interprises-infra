variable "nic_name" {
  description = "The name of the network interface card (NIC)."
  type        = string
}

variable "location" {
  description = "The Azure region where the NIC will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the NIC."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet to which the NIC will be connected."
  type        = string
}

variable "public_ip_id" {
  type    = string
  default = null
}
