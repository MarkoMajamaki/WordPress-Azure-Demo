output "server_fqdn" {
	value = azurerm_mysql_server.mysql_server.fqdn
}

output "server_password" {
	value = azurerm_mysql_server.mysql_server.administrator_login_password
}

output "server_username" {
	value = azurerm_mysql_server.mysql_server.administrator_login
}

output "database_name" {
	value = azurerm_mysql_database.mysql_database.name
}