# This template declares the values that will be output by the
# deployment and accessible by other programs

output "resource_group_name" {
  description = "Name of the resource group for the remote state"
  value = azurerm_resource_group.rg.name
  depends_on = [
    azurerm_resource_group.rg
  ]
}

output "storage_account_name" {
  description = "Name of the generated storage account"
  value       = azurerm_storage_account.sa.name
  depends_on = [
    azurerm_storage_account.sa
  ]
}
