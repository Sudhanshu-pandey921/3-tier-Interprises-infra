variable "nsg_name" {
  description = "The name of the Network Security Group"
  type        = string
}

variable "location" {
  description = "The location where the Network Security Group will be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Network Security Group"
  type        = string
}