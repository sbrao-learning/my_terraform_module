variable "myvms" {
  type = map(object({
    name                             = string
    location                         = string
    resource_group_name              = string
    vm_size                          = string
    delete_os_disk_on_termination    = bool
    delete_data_disks_on_termination = bool
    publisher                        = string
    offer                            = string
    sku                              = string
    version                          = string
    storage_name                     = string
    caching                          = string
    create_option                    = string
    managed_disk_type                = string


    computer_name                   = string
    admin_username                  = string
    admin_password                  = string
    disable_password_authentication = bool
    nic_key                         = string

  }))
}

variable "nic_ids" {
  type = map(string)

}