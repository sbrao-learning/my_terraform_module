output "vnet_id" {
  value = {
    for k, v in azurerm_virtual_network.myvnet :
    k => v.id
  }
}

output "vnet_ip_pool" {
  value = {
    for k, v in azurerm_virtual_network.myvnet :
    k => v.ip_address_pool
  }
}