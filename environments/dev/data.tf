data "azurerm_key_vault" "kv" {
  name                = "datakeyvaulthai"
  resource_group_name = "data-rg"
}

data "azurerm_key_vault_secret" "kv_secret" {
  name         = "userpandeyhai"
  key_vault_id = data.azurerm_key_vault.kv.id
}