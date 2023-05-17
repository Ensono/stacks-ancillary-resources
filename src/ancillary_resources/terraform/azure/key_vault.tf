# This template creates the keyvault(s) for the specified instances
#
# This is defined by the `key_vaults` list

resource "azurerm_key_vault" "kv" {

  # for_each = toset(local.kv_instances)
  for_each = { for i, v in var.key_vaults : i => v }

  name                = substr(format("%s-%s", module.default_name.id, each.value.name), 0, 24)
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku_name = each.value.sku != "" ? each.value.sku : var.key_vault_sku

  tenant_id = data.azurerm_client_config.service_principal.tenant_id

  access_policy {
    tenant_id      = data.azurerm_client_config.service_principal.tenant_id
    object_id      = data.azurerm_client_config.service_principal.object_id
    application_id = data.azurerm_client_config.service_principal.client_id

    secret_permissions      = var.key_vault_secret_perms
    certificate_permissions = var.key_vault_cert_perms
    key_permissions         = var.key_vault_key_perms
    storage_permissions     = var.key_vault_storage_perms
  }

}
