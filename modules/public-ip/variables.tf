variable "public_ip_name" {
    description = "The name of the Public IP"
    type        = string
}

variable "location" {
    description = "The location/region where the Public IP will be created"
    type        = string
}

variable "resource_group_name" {
    description = "The name of the Resource Group in which to create the Public IP"
    type        = string
}

variable "allocation_method" {
    description = "The allocation method for the Public IP (Static or Dynamic)"
    type        = string
}

variable "sku" {
    description = "The SKU of the Public IP (Basic or Standard)"
    type        = string
}