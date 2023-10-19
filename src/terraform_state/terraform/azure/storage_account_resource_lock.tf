# Ensure that the storage account cannot be deleted
# This is because it contains all the information about resources that Terraform has depolyed
# thus it needs to be protected

resource "azurerm_management_lock" "sa_level" {

  count = var.deploy_locks ? 1 : 0

  name       = "tfstate-storage-lock"
  scope      = azurerm_storage_account.sa.id
  lock_level = "CanNotDelete"
  notes      = "Locked to prevent accidental deletion of Terraform state data"

  depends_on = [
    azurerm_storage_account.sa
  ]
}
