resource "azurerm_virtual_machine" "vm" {
  for_each                         = var.myvms
  name                             = each.value.name
  location                         = each.value.location
  resource_group_name              = each.value.resource_group_name
  network_interface_ids            = [var.nic_ids[each.value.nic_key]]
  vm_size                          = each.value.vm_size
  delete_os_disk_on_termination    = each.value.delete_os_disk_on_termination
  delete_data_disks_on_termination = each.value.delete_data_disks_on_termination

  storage_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
  storage_os_disk {
    name              = each.value.storage_name
    caching           = each.value.caching
    create_option     = each.value.create_option
    managed_disk_type = each.value.managed_disk_type
  }
  os_profile {
    computer_name  = each.value.computer_name
    admin_username = each.value.admin_username
    admin_password = each.value.admin_password
  }
  os_profile_linux_config {
    disable_password_authentication = each.value.disable_password_authentication
  }

}