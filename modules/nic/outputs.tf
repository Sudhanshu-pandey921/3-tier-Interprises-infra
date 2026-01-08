output "nic_id" {
  description = "The ID of the Network Interface Card (NIC)."
  value       = azurerm_network_interface.nic.id
}