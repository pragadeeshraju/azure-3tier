resource "azurerm_mssql_server" "db_server" {
    name = var.primary_database
    resource_group_name = var.resource_group
    location = var.location
    version = var.primary_database_version
    administrator_login = var.primary_database_admin
    administrator_login_password = var.primary_database_password
}

resource "azurerm_mssql_database" "db" {
  name                = "db"
  server_id      = azurerm_mssql_server.db_server.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 1
  sku_name       = "S0"
}

resource "azurerm_mssql_virtual_network_rule" "vnet_rule" {
  name      = "sql-vnet-rule"
  server_id = azurerm_mssql_server.db_server.id
  subnet_id = var.db_subnet_id
}