output "vm_name" {
  description = "The name of the Virtual Machine"
  value       = azurerm_linux_virtual_machine.example.name
}

output "vm_private_ip" {
  description = "The private IP address of the Virtual Machine"
  value       = azurerm_network_interface.example.ip_configuration[0].private_ip_address
}

output "resource_group" {
  description = "The resource group in which resources are deployed"
  value       = var.resource_group_name
}
