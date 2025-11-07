variable "kvs" {
  type = map(object({
    key_vault_secret_name = string
    vm_secrets          = string
  }))
}