variable "resource_group" {
  type = map(object({
    name     = string
    location = string
  }))
}

variable "storage_account" {
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
  }))

}

variable "virtual_network" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    vnet_addr_space     = list(string)
  }))

}

variable "vnet_id_check" {}

variable "nsg" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    security_rule = list(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))

  }))
}

variable "subnet" {
  type = map(object({
    name                = string
    resource_group_name = string
    vnet_name           = string
    subnet_add_prefix   = list(string)
  }))

}


variable "subnet_nsg_association" {
  type = map(object({
    subnet_key = string
    nsg_key    = string
  }))

}


variable "pip" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    allocation_method   = string
  }))
}


variable "nic" {
  type = map(object({
    name                  = string
    resource_group_name   = string
    location              = string
    ip_name               = string
    private_ip_allocation = string
    subnet_key            = string
    pip_key               = string

  }))
}


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
