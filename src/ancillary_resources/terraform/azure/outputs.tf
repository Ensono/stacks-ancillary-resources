# This template declares all of the values that are requyired by other
# templates, e.g. the DNS zones

output "resource_group_name" {
  description = "Name of the resource group for the anciallry resources"
  value       = azurerm_resource_group.rg.name
  depends_on = [
    azurerm_resource_group.rg
  ]
}

output "key_vault" {
  description = "Information about the Key Vaults that have been deployed"
  value = {
    prod = var.key_vault_instances.prod != "" ? {
      id   = azurerm_key_vault.kv[var.key_vault_instances.prod].id
      name = azurerm_key_vault.kv[var.key_vault_instances.prod].name
      url  = azurerm_key_vault.kv[var.key_vault_instances.prod].vault_uri
    } : null
    nonprod = var.key_vault_instances.nonprod != "" ? {
      id   = azurerm_key_vault.kv[0].id
      name = azurerm_key_vault.kv[0].name
      url  = azurerm_key_vault.kv[0].vault_uri
    } : null
  }
  depends_on = [
    azurerm_key_vault.kv
  ]
}

output "log_analytics" {
  description = "Information about the deployed Log Analytics Workspace"
  value = var.deploy_log_analytics ? {
    id   = azurerm_log_analytics_workspace.la[0].id
    name = azurerm_log_analytics_workspace.la[0].name
  } : null
  depends_on = [
    azurerm_log_analytics_workspace.la
  ]
}

output "container_registry" {
  description = "Information about the container registry"
  value = var.container_registry ? {
    id       = azurerm_container_registry.registry[0].name
    url      = azurerm_container_registry.registry[0].login_server
    location = azurerm_container_registry.registry[0].location
  } : null
  depends_on = [
    azurerm_container_registry.registry
  ]
}

output "dns_zones" {
  description = "Information about the DNS Zones that have been created"

  value = {
    public = length(local.dns_zones["public"]) > 0 ? {
      for index, zone in local.dns_zones["public"] :
      zone => {
        id           = azurerm_dns_zone.dns_zone_public[zone].id
        name_servers = azurerm_dns_zone.dns_zone_public[zone].name_servers
      }
    } : null

    private = length(local.dns_zones["private"]) > 0 ? {
      for index, zone in local.dns_zones["private"] :
      zone => {
        id = azurerm_private_dns_zone.dns_zone_private[zone].id
      }
    } : null
  }

  depends_on = [
    azurerm_dns_zone.dns_zone_public,
    azurerm_private_dns_zone.dns_zone_private
  ]
}
