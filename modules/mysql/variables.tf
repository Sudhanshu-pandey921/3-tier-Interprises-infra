variable "sql_server_name" {
  description = "The name of the SQL server."
  type        = string
}

variable "sql_admin_username" {
  description = "The administrator username for the SQL server."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the SQL server."
  type        = string
}

variable "location" {
  description = "The Azure location where the SQL server will be created."
  type        = string
}

variable "sql_admin_password" {
  description = "The administrator password for the SQL server."
  type        = string
}