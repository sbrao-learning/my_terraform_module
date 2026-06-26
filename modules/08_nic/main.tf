resource "azurerm_network_interface" "mynic" {
  for_each            = var.nic
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = each.value.ip_name
    subnet_id                     = var.subnet_ids[each.value.subnet_key]
    private_ip_address_allocation = each.value.private_ip_allocation
    public_ip_address_id          = var.pip_ids[each.value.pip_key]
  }
}