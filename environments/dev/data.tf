data "azurerm_key_vault" "kv" {
  name                = "pandeykeyvault"
  resource_group_name = "data-rg"
}

data "azurerm_key_vault_secret" "kv_secret" {
  name         = "practicesecrethai"
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "sql_username" {
  name         = "sqlusername"
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "sql_password" {
  name         = "sqlpassward"
  key_vault_id = data.azurerm_key_vault.kv.id
}
