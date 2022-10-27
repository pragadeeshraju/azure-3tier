provider "azurerm" {
  subscription_id     = var.subscription_id
  client_id           = var.client_id
  client_secret       = var.client_secret
  tenant_id           = var.tenant_id
  features {}
}

module "resourcegroup" {
  source         = "./azure-modules/resourcegroup"
  name           = var.name
  location       = var.location
}

module "vnet" {
  source         = "./azure-modules/virtualnetwork"
  location       = module.resourcegroup.location_id
  resource_group = module.resourcegroup.resource_group_name
  vnetcidr       = var.vnetcidr
  websubnetcidr  = var.websubnetcidr
  appsubnetcidr  = var.appsubnetcidr
  dbsubnetcidr   = var.dbsubnetcidr
  web_subnet_id  = module.vnet.websubnet_id
  app_subnet_id  = module.vnet.appsubnet_id
  db_subnet_id   = module.vnet.dbsubnet_id
}


module "virtualmachine" {
  source         = "./azure-modules/virtualmachine"
  location = module.resourcegroup.location_id
  resource_group = module.resourcegroup.resource_group_name
  web_subnet_id = module.vnet.websubnet_id
  app_subnet_id = module.vnet.appsubnet_id
  web_host_name = var.web_host_name
  web_username = var.web_username
  web_os_password = var.web_os_password
  app_host_name = var.app_host_name
  app_username = var.app_username
  app_os_password = var.app_os_password
}

module "database" {
  source = "./azure-modules/database"
  location = module.resourcegroup.location_id
  resource_group = module.resourcegroup.resource_group_name
  primary_database = var.primary_database
  primary_database_version = var.primary_database_version
  primary_database_admin = var.primary_database_admin
  primary_database_password = var.primary_database_password
  db_subnet_id   = module.vnet.dbsubnet_id
}
