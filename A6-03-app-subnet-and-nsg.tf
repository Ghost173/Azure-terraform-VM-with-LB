# Resource-1: Create AppTier Subnet
resource "azurerm_subnet" "appsubnet" {
  name                 = "${azurerm_virtual_network.vnet.name}-${var.app_subnet_name}"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.app_subnet_address  
}

# Resource-2: Create Network Security Group (NSG)
resource "azurerm_network_security_group" "app_nsg" {
  name                = "${azurerm_subnet.appsubnet.name}-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  dynamic "security_rule" {
    for_each = var.app_subnet_ngs_inbound_ports
    content {
      name                       = "inbound-rule-${security_rule.key}"
      description                = "Inbound Rule ${security_rule.key}"    
      priority                   = sum([100, security_rule.key])
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = security_rule.value
      source_address_prefix      = "*"
      destination_address_prefix = "*"      
    }
  }

}

# Resource-3: Associate NSG and Subnet
resource "azurerm_subnet_network_security_group_association" "app_subnet_nsg_associaten" {
  depends_on = [ azurerm_network_security_group.app_nsg ]
  subnet_id = azurerm_subnet.appsubnet.id
  network_security_group_id = azurerm_network_security_group.app_nsg.id
  
}