variable "subnet_nsg_association" {
  type = map(object({
    subnet_key = string
    nsg_key    = string
  }))

}

variable "subnet_ids" {
  type = map(string)

}


variable "nsg_ids" {
  type = map(string)

}