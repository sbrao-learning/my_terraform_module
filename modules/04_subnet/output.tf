output "subnet_id" {
  value = {
    for k, v in azurerm_subnet.mysubnet :
    k => v.id
  }
}