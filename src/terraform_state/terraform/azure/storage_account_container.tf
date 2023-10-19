# Create the container that Terraform will use to store the state

resource "azurerm_storage_container" "sa_container" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "container"
}
