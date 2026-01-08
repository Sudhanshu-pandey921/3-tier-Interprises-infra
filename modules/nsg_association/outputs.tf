output "nsg_association_id" {
  description = "The ID of the NSG association."
  value       = azurerm_subnet_network_security_group_association.nsg_association.id
}