# Creates the log analytics workspace that applications and other resources
# can send logs to

resource "azurerm_log_analytics_workspace" "la" {
  count = var.deploy_log_analytics ? 1 : 0

  name                = module.default_name.id
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku               = var.log_analytics_sku
  retention_in_days = var.log_analytics_sku == "Free" ? 7 : var.log_analytics_retention
}
