module "rg" {
  source              = "../../modules/resource_group"
  for_each            = var.rg
  resource_group_name = each.value.name
  location            = each.value.location
}

module "vnet" {
  source              = "../../modules/vnet"
  for_each            = var.vnet
  vnet_name           = each.value.name
  address_space       = each.value.address_space
  location            = each.value.location
  resource_group_name = module.rg["dev"].resource_group_name
  depends_on          = [module.rg]
}

module "subnet" {
  source               = "../../modules/subnet"
  for_each             = var.subnet
  subnet_name          = each.value.name
  address_prefixes     = each.value.address_prefixes
  virtual_network_name = module.vnet[each.value.vnet_key].vnet_name
  resource_group_name  = module.rg[each.value.rg_key].resource_group_name
  depends_on           = [module.vnet]
}

module "nsg" {
  source              = "../../modules/nsg"
  for_each            = var.nsg
  nsg_name            = each.value.name
  location            = each.value.location
  resource_group_name = module.rg[each.value.rg_key].resource_group_name
  depends_on          = [module.rg]
}

module "nsg_association" {
  source                    = "../../modules/nsg_association"
  for_each                  = var.nsg_association
  network_security_group_id = module.nsg[each.value.nsg_key].nsg_id
  subnet_id                 = module.subnet[each.value.subnet_key].subnet_id
  depends_on                = [module.nsg, module.subnet]
}

module "public_ip" {
  source              = "../../modules/public-ip"
  for_each            = var.pip
  public_ip_name      = each.value.name
  location            = each.value.location
  resource_group_name = module.rg[each.value.rg_key].resource_group_name
  allocation_method   = each.value.allocation_method
  sku                 = each.value.sku
  depends_on          = [module.rg]
}

module "nics" {
  source              = "../../modules/nic"
  for_each            = var.nics
  nic_name            = each.value.name
  location            = each.value.location
  resource_group_name = module.rg[each.value.rg_key].resource_group_name
  subnet_id           = module.subnet[each.value.subnet_key].subnet_id
  depends_on          = [module.rg, module.subnet, module.nsg]
}

module "vm" {
  source              = "../../modules/linux_vm"
  for_each            = var.vms
  vm                  = each.value.vm
  location            = each.value.location
  resource_group_name = module.rg["dev"].resource_group_name
  vm_size             = each.value.vm_size
  admin_username      = data.azurerm_key_vault_secret.kv_secret.value
  admin_password      = data.azurerm_key_vault_secret.kv_secret.value
  nic_ids             = [module.nics[each.value.nics_key].nic_id]

  depends_on = [module.rg, module.vnet, module.subnet, module.nsg, module.nics]
}

module "mysql" {
  source              = "../../modules/mysql"
  for_each            = var.mysql
  sql_server_name     = each.value.sql_server_name
  location            = each.value.location
  resource_group_name = module.rg["dev"].resource_group_name
  sql_admin_username  = data.azurerm_key_vault_secret.kv_secret.value
  sql_admin_password  = data.azurerm_key_vault_secret.kv_secret.value

  depends_on = [module.rg]
}

module "database" {
  source      = "../../modules/sql_database"
  for_each    = var.sql_database
  sql_db_name = each.value.name
  server_id   = module.mysql[each.value.mysql_key].sql_server_id
  max_size_gb = 2

  depends_on = [module.mysql]
}





