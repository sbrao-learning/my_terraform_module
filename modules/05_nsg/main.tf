resource "azurerm_network_security_group" "mynsg" {
  for_each            = var.nsg
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
}