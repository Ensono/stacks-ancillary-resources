# Template to configure DNS zones for Stacks
#
# This includes both private and public DNS zones
#
# These zones do not have to be created by this repository, indeed it is fully
# accepted that clients will not want to create new DNS zones in Azure for this purpose

resource "azurerm_dns_zone" "dns_zone_public" {
  for_each = toset(local.dns_zones["public"])

  name                = each.value
  resource_group_name = azurerm_resource_group.rg.name
  depends_on          = [azurerm_resource_group.rg]
}

resource "azurerm_private_dns_zone" "dns_zone_private" {
  for_each = toset(local.dns_zones["private"])

  name                = each.value
  resource_group_name = azurerm_resource_group.rg.name
  depends_on          = [azurerm_resource_group.rg]
}
