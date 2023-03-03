resource_group_name = "nic-test-rg"

name = "module-test-nic"
location = "uksouth"

ip_configuration = {
  name = "internal"
  private_ip_address_allocation = "Dynamic"
}