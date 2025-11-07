variable "nsg" {

type = map(object({
  name = string
  location = string
  resource_group_name = string
  security_rule = map(object({
    name = string
    direction = string 
    access = string
    priority = number
    protocol = string
    source_port_range = string
    destination_port_range = string
    source_address_prefix = string
    destination_address_prefix = string
  }))
}))

}

