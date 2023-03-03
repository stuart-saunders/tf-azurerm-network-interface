variable "resource_group_name" {
  type        = string
  description = "(Required) The name the Resource Group in which to create the Network Interface"
}

# variable "resource_group_location" {
#   type        = string
#   description = "(Required) The Azure region in which the Resource Group should be created"
# }

variable "name" {
  description = "The name to assign to the Network Interface"
  type        = string
}

variable "location" {
  type = string
  description = "The Azure location where the Network Interface should be created"
}

# variable "ip_configuration" {
#   type = object({
#     name = string
#     gateway_load_balancer_frontend_ip_configuration_id = optional(string)
    
#     private_ip_address_allocation = string
#     public_ip_address_id = optional(string)
    
#     primary = optional(bool)
#     private_ip_address = optional(string)
#     subnet_id = string
#   })
#   description = "The IP Configuration settings for this Network Interface"
#   default = null
# }

variable "ip_configuration_name" {
  type = string
  description = "The IP Configuration Name"
  default = null
}

variable "ip_configuration_gateway_load_balancer_frontend_ip_configuration_id" {
  type = string
  description = "The Frontend IP Configuration ID of a Gateway SKU Load Balancer"
  default = null
}

variable "ip_configuration_private_ip_address_allocation" {
  type = string
  description = "The allocation method used for the Private IP Address. Possible values are Dynamic and Static."
}

variable "ip_configuration_public_ip_address_id" {
  type = string
  description = "Reference to a Public IP Address to associate with this NIC"
  default = null
}

variable "ip_configuration_primary" {
  type = bool
  description = "Specifies if this this the primary Network Interface"
  default = null
}

variable "ip_configuration_private_ip_address" {
  type = string
  description = "The Static IP address to assign to the Network Interface"
  default = null
}

variable "ip_configuration_subnet_id" {
  type = string
  description = "The ID of the Subnet where this Network Interface should be located"  
}

variable "dns_servers" {
  type = list(string)
  description = "A list of IP Addresses defining the DNS Servers which should be used for this Network Interface"
  default = null
}

variable "edge_zone" {
  type = string
  description = "Specifies the Edge Zone within the Azure Region where this Network Interface should exist"
}

variable "enable_ip_forwarding" {
  type = string
  description = "Specifies if IP forwarding should be enabled"
  default = null
}

variable "enable_accelerated_networking" {
  type = string
  description = "Specifies if accelerated networking should be enabled"
  default = null
}

variable "internal_dns_name_label" {
  type = string
  description = "The (relative) DNS Name used for internal communications between Virtual Machines in the same Virtual Network"
  default = null
}

variable "tags" {
  type        = map(string)
  description = "(Optional) The list of tags to apply to the resources"
  default     = {}
}