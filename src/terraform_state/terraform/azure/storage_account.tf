# Creates a storage account in Azure to be used as the Terraform state for all resources
# deployed by Amido stacks into the tenant
#
# As this is setting up teh remote stae, the state for this resource will not be saved
# so a script will run during the build to ensure that this resouce exists and will not
# be applied if it does. The pipeline will not attempt to keep the local state for this resource

resource "azurerm_storage_account" "sa" {
  name     = local.sa_name
  location = azurerm_resource_group.rg.location

  resource_group_name = azurerm_resource_group.rg.name

  account_tier             = "Standard"
  account_replication_type = "LRS"

  # Prevent Terraform from destorying or recreating this resource as the state is 
  # not stored anywhere
  lifecycle {
    prevent_destroy = true
  }

  blob_properties {
    container_delete_retention_policy {
      days = var.retention_days
    }
  }

  tags = local.tags
}
