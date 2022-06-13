# Ensure that the resource group has a CanNotDelete flag set

resource "azurerm_management_lock" "rg_level" {

  count = var.deploy_locks ? 1 : 0

  name       = azurerm_resource_group.rg.name
  scope      = azurerm_resource_group.rg.id
  lock_level = "CanNotDelete"
  notes      = "Prevent the resource group from being deleted"

  depends_on = [
    azurerm_resource_group.rg
  ]
}
