variable "subnet" {
  type = map(object({
    name                = string
    resource_group_name = string
    vnet_name           = string
    subnet_add_prefix   = list(string)
  }))

}