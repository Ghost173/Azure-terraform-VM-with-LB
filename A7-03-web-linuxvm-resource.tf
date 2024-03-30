resource "azurerm_linux_virtual_machine" "web_linuxvm" {
  count                 = var.web_linuxvm_instance_count
  name                  = "VM-${count.index}-web-linux"
  resource_group_name   = azurerm_resource_group.rg.name
  location              = azurerm_resource_group.rg.location
  size                  = "Standard_DS1_v2"
  admin_username        = "azureuser"
  network_interface_ids = [element(azurerm_network_interface.web_linuxvm_nic[*].id, count.index)]
  tags                  = local.common_tags

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("${path.module}/ssh/terraform-azure.pub")
  }

  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "8-lvm-gen2"
    version   = "latest"
  }

  custom_data = filebase64("${path.module}/app-scripts/redhat-webvm-script.sh")
}
