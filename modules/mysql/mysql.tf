
# Random password
resource "random_password" "mysql_password" {
  length = 64
  special = false
}

# MySQL server
resource "azurerm_mysql_server" "mysql_server" {
  name                = var.server_name
  location            = var.location
  resource_group_name = var.rg_name

  administrator_login          = var.admin_username
  administrator_login_password = random_password.mysql_password.result

  sku_name   = var.server_sku
  storage_mb = var.server_storage
  version    = "5.7"

  auto_grow_enabled                 = true
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = false
  public_network_access_enabled     = true
  ssl_enforcement_enabled           = false
  ssl_minimal_tls_version_enforced  = "TLSEnforcementDisabled"
}

# MySQL database
resource "azurerm_mysql_database" "mysql_database" {
  name                = var.database_name
  resource_group_name = var.rg_name
  server_name         = azurerm_mysql_server.mysql_server.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}

# ?
resource "azurerm_mysql_firewall_rule" "firewall_rule" {
  name                = "public-internet"
  resource_group_name = var.rg_name
  server_name         = azurerm_mysql_server.mysql_server.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "255.255.255.255"
}