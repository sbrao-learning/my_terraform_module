output "pip_id" {
  value = {
    for k, v in azurerm_public_ip.publ_ip :
    k => v.id
  }
}