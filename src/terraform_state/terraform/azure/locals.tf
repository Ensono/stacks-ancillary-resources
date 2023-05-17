# Contains all the locals that are used in the templates

locals {

  # Name of the resource group, this is either a generated name or
  # if this is not desired it is the name as specified
  rg_name = var.generate_rg_name ? module.generated_rg_name.id : var.resource_group_name

  # Name of the storage account, this is either the generated name, or
  # if this is not wanted then it is the name on its own
  sa_name = var.generate_sa_name ? module.generated_sa_name.id : var.name

  # Create the tags that need to be added to each of the resources
  tags = {
    "created_by" = data.azurerm_client_config.service_principal.client_id
  }
}
