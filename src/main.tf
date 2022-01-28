
// Access the Azure configuration
data "azurerm_client_config" "current" {}

// Create the resource group
resource "azurerm_resource_group" "rg" {
    name = var.resource_group_name
    location = var.location

    tags = {
        InUse = "true"
    }
}

// Storage account name for storing remote Terraform state
resource "azurerm_storage_account" "sa" {
    name = var.sa_name
    location = azurerm_resource_group.rg.location

    resource_group_name = azurerm_resource_group.rg.name

    account_tier             = "Standard"
    account_replication_type = "LRS"
}

resource "azurerm_storage_container" "sa_container" {
    name = var.sa_container
    storage_account_name = azurerm_storage_account.sa.name
    container_access_type = "container"
}

// Create a log analytics workspace
resource "azurerm_log_analytics_workspace" "la" {
    name = var.la_name
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    sku = var.la_sku
    retention_in_days = var.la_retention
}

// Create the Key Vault for secrets
resource "azurerm_key_vault" "kv_nonprod" {
    name = var.key_vault_name_nonprod
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    sku_name = var.key_vault_sku
    tenant_id = data.azurerm_client_config.current.tenant_id

    access_policy {
        tenant_id = var.app_tenant_id
        object_id = var.app_object_id
        application_id = var.app_application_id

        secret_permissions = [
            "Get", "List"
        ]
    }
}

resource "azurerm_key_vault" "kv_prod" {
    name = var.key_vault_name_prod
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    sku_name = var.key_vault_sku
    tenant_id = data.azurerm_client_config.current.tenant_id

    access_policy {
        tenant_id = var.app_tenant_id
        object_id = var.app_object_id
        application_id = var.app_application_id

        secret_permissions = [
            "Get", "List"
        ]
    }
}

// Create the DNS zones that AKS will use
// This enables the cluster to be rebuilt without having to update the nameservers
// each time
resource "azurerm_dns_zone" "stacks_zones" {
    for_each = toset(var.dns_zones)

    name = each.value
    resource_group_name = azurerm_resource_group.rg.name
    depends_on = [azurerm_resource_group.rg]
}

resource "azurerm_private_dns_zone" "stacks_private_zones" {
    for_each = toset(var.dns_private_zones)

    name = each.value
    resource_group_name = azurerm_resource_group.rg.name
    depends_on = [azurerm_resource_group.rg]
}

