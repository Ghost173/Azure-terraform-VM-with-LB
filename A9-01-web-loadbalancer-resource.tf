# Resource-1: Create Public IP Address for Azure Load Balancer
resource "azurerm_public_ip" "web_loadblance_pub_ip" {
  name                = "lb-publicip"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = local.common_tags
}


# Resource-2: Create Azure Standard Load Balancer
resource "azurerm_lb" "web_lb" {
  name                = "lb-weblb"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "web-lb-publicip-1"
    public_ip_address_id = azurerm_public_ip.web_loadblance_pub_ip.id
  }
}

# Resource-3: Create LB Backend Pool
resource "azurerm_lb_backend_address_pool" "web_lb_backend_address_pool" {
  name            = "web-backend"
  loadbalancer_id = azurerm_lb.web_lb.id
}

# Resource-4: Create LB Probe
resource "azurerm_lb_probe" "web_lb_probe" {
  loadbalancer_id = azurerm_lb.web_lb.id
  name            = "tcp-probe"
  port            = 80
  protocol        = "Tcp"

}

# Resource-5: Create LB Rule
resource "azurerm_lb_rule" "web_lb_rule_app1" {
  name                           = "web-app1-rule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = azurerm_lb.web_lb.frontend_ip_configuration[0].name
  loadbalancer_id                = azurerm_lb.web_lb.id
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.web_lb_backend_address_pool.id]
  probe_id                       = azurerm_lb_probe.web_lb_probe.id
}

# Resource-6: Associate Network Interface and Standard Load Balancer
resource "azurerm_network_interface_backend_address_pool_association" "web_nic_lb_associate" {
  count                 = var.web_linuxvm_instance_count
  network_interface_id  = element(azurerm_network_interface.web_linuxvm_nic[*].id, count.index)
  ip_configuration_name = element(azurerm_network_interface.web_linuxvm_nic[*].ip_configuration[0].name, count.index)
  backend_address_pool_id = azurerm_lb_backend_address_pool.web_lb_backend_address_pool.id

}
