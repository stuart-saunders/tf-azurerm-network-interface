resource "azurerm_resource_group" "this" {
  name = var.resource_group_name
  location = var.location
}

module "nic" {
  name = var.name
  location = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name

  ip_configuration_name = var.ip_configuration_name
  ip_configuration_gateway_load_balancer_frontend_ip_configuration_id = var.ip_configuration_gateway_load_balancer_frontend_ip_configuration_id
  ip_configuration_private_ip_address_allocation = var.ip_configuration_private_ip_address_allocation
}