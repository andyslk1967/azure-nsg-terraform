output "nsg_id" {
  description = "The ID of the Network Security Group."
  value       = azurerm_network_security_group.nsg_port3342.id
}

output "nsg_name" {
  description = "The name of the Network Security Group."
  value       = azurerm_network_security_group.nsg_port3342.name
}

output "nsg_location" {
  description = "The Azure region where the NSG is deployed."
  value       = azurerm_network_security_group.nsg_port3342.location
}

output "nsg_resource_group" {
  description = "The resource group containing the NSG."
  value       = azurerm_network_security_group.nsg_port3342.resource_group_name
}
