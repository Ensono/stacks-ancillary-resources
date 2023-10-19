# Creates the resource group to be used for the storage account for storing the
# ancillary resources required for Stacks

# Create the resource group
resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location

  tags = local.tags
}
