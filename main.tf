resource "azurerm_network_interface" "this" {
  name                = "${var.name}"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name

  ip_configuration {
    name                          = var.ip_configuration.name
    private_ip_address_allocation = var.ip_configuration.private_ip_address_allocation

    gateway_load_balancer_frontend_ip_configuration_id = var.ip_configuration.gateway_load_balancer_fronend_ip_configuration_id

    primary                    = var.ip_configuration.primary
    private_ip_address         = var.ip_configuration.private_ip_address
    private_ip_address_version = var.ip_configuration.private_ip_address_version
    public_ip_address_id       = var.ip_configuration.public_ip_address_id
    subnet_id                  = var.ip_configuration.subnet_id
  }

  dns_servers = var.dns_servers
  edge_zone = var.edge_zone
  enable_ip_forwarding = var.enable_ip_forwarding
  enable_accelerated_networking = var.enable_accelerated_networking
  internal_dns_name_label = var.enable_accelerated_networking

  tags = var.tags
}

resource "azurerm_network_interface_application_gateway_backend_address_pool_association" "this" {
  for_each = var.application_gateway_backend_address_pool_id != null ? [1] : []
  
  network_interface_id    = azurerm_network_interface.this.id
  ip_configuration_name   = azurerm_network_interface.this.ip_configuration.name
  backend_address_pool_id = var.application_gateway_backend_address_pool_id
}

resource "azurerm_network_interface_application_security_group_association" "this" {
  for_each = var.application_security_group_id != null ? [1] : []

  network_interface_id          = azurerm_network_interface.this.id
  application_security_group_id = var.application_security_group_id
}

resource "azurerm_network_interface_backend_address_pool_association" "this" {
  for_each = var.backend_address_pool_id != null ? [1] : []

  network_interface_id    = azurerm_network_interface.this.id
  ip_configuration_name   = azurerm_network_interface.this.ip_configuration.name
  backend_address_pool_id = var.backend_address_pool_id
}

resource "azurerm_network_interface_nat_rule_association" "this" {
  for_each = var.nat_rule_id != null ? [1] : []

  network_interface_id  = azurerm_network_interface.this.id
  ip_configuration_name = azurerm_network_interface.this.ip_configuration.name
  nat_rule_id           = var.nat_rule_id
}

resource "azurerm_network_interface_security_group_association" "this" {
  for_each = var.network_security_group_id != null ? [1] : []

  network_interface_id      = azurerm_network_interface.this.id
  network_security_group_id = var.network_security_group_id
}