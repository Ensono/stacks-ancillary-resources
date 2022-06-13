# Contains all the locals that are used in the templates

locals {

  # If a name of the resource group has been specified, use it otherwise generate the name
  rg_name = var.resource_group_name == "" ? module.default_name.id : var.resource_group_name

  # Each region must have corresponding a shortend name for resource naming purposes
  location_name_map = {
    northeurope   = "eun"
    westeurope    = "euw"
    uksouth       = "uks"
    ukwest        = "ukw"
    eastus        = "use"
    eastus2       = "use2"
    westus        = "usw"
    eastasia      = "ase"
    southeastasia = "asse"
  }

  # Create an array to iterate around for the key vault instances
  kv_instances = flatten([
    for key, value in var.key_vault_instances : value if value != ""
  ])

  # Setup the default internal domains if they havce not been set
  # These will based on the public zones with the internal_domain_suffix added to it
  dns_zones = {
    public = var.dns_zones["public"]
    private = length(var.dns_zones["private"]) > 0 ? var.dns_zones["private"] : flatten([
      for zone in var.dns_zones["public"] : format("%s.%s", zone, var.internal_domain_suffix)
    ])
  }
}
