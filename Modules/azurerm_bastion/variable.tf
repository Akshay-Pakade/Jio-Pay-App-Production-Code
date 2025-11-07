variable "bastion_host" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
     subnet_key = string
    public_key = string
  }))
}



variable "subnet" {
  type = map(object({


    name                 = string
    virtual_network_name = string
    resource_group_name  = string

  }))
}

variable "public_ip_address" {
  type = map(object({
    name                = string
    resource_group_name = string

  }))
}

