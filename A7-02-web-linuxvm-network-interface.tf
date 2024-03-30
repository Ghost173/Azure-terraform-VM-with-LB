resource "azurerm_network_interface" "web_linuxvm_nic" {
  count               = var.web_linuxvm_instance_count
  name                = "web-linixvm-nic-${count.index}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = local.common_tags

  ip_configuration {
    name                          = "web-linic-vm-ipconf"
    subnet_id                     = azurerm_subnet.appsubnet.id
    private_ip_address_allocation = "Dynamic"
  }

}
