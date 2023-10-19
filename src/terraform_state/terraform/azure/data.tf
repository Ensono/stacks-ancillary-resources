# Data decalrations to get information about the current deployment

# - information about the current subscription
data "azurerm_subscription" "subscription" {}

# - information about the service princpal being used to conduct the deployment
data "azurerm_client_config" "service_principal" {}

