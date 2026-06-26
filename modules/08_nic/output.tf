output "nic_id" {
  value = {
    for k, v in azurerm_network_interface.mynic :
    k => v.id
  }

}