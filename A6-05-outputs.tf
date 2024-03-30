#RG
output "resource_group_name" {
  description = "this is the resource group name"
  value       = azurerm_resource_group.rg.name
}
#Vnet
output "vnet_name" {
  description = "vnet name"
  value       = azurerm_virtual_network.vnet.name
}


#Subnets
output "appsubnet_name" {
  description = "web subnet name"
  value       = azurerm_subnet.appsubnet.name
}

#app subnet id 
output "appsubnet_id" {
  description = "web subnet id"
  value       = azurerm_subnet.appsubnet.id
}

#appsubnebt nsg name
output "appsubnet_nsg" {
  description = "appsubnet NSG name"
  value       = azurerm_network_security_group.app_nsg.name
}

#Bastion subnet
# Bastion name
output "bastionubnet_name" {
  description = "web subnet name"
  value       = azurerm_subnet.bastionsubnet.name
}

#bastionsubnet id 
output "bastionubnet_id" {
  description = "web subnet id"
  value       = azurerm_subnet.bastionsubnet.id
}
