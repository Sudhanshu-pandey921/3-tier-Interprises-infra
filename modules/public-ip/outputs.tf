output "public_ip_id" {
  description = "The ID of the public IP address."
  value       = azurerm_public_ip.pip.id
}

output "public_ip_address" {
  description = "The allocated public IP address."
  value       = azurerm_public_ip.pip.ip_address
}