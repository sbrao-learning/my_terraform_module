variable "virtual_network" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    vnet_addr_space     = list(string)
  }))

}