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

variable "subnet_ids" {
  type = map(string)

}

variable "pip_ids" {
  type = map(string)

}