provider "azurerm" {
  features {}
}

module "rg" {
  source = "./modules/rg"
  name = var.rg_name
  location = var.location
}

module "mysql" {
  source = "./modules/mysql"
  location = module.rg.location
  rg_name = module.rg.name
  server_name = var.mysql_server_name
  admin_username = var.mysql_admin_username
  server_sku = var.mysql_server_sku
  server_storage = var.mysql_server_storage
  database_name = var.mysql_database_name
}

module "app_service" {
  source = "./modules/appservice"
  location = module.rg.location
  rg_name = module.rg.name
  service_plan_name = var.service_plan_name
  service_plan_tier = var.service_plan_tier
  service_plan_size = var.service_plan_size
  app_service_name = var.app_service_name
  image_name = var.wordpress_image
  app_settings = {
      "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
      "WORDPRESS_DB_HOST"                   = module.mysql.server_fqdn
      "WORDPRESS_DB_NAME"                   = module.mysql.database_name
      "WORDPRESS_DB_USER"                   = module.mysql.server_username
      "WORDPRESS_DB_PASSWORD"               = module.mysql.server_password
      "DOCKER_ENABLE_CI"                    = "true"
  }
}