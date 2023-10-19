# Create a container registry for containers to be pushed to that will
# ultimately be deployed into Kubernetes

resource "azurerm_container_registry" "registry" {
  count = var.container_registry ? 1 : 0

  name                = replace(module.default_name.id, "-", "")
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  admin_enabled = var.container_registry_admin

  sku = var.container_registry_sku

  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}
