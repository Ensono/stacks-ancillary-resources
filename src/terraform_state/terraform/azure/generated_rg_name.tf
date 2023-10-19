# Template that references the Default Label module to provide a consistent
# and predictable naming system for resources.
#
# Some reesources, such as a storage account, must be globally unique and this
# module will allow such a name to be generated based on variables passed to it

module "generated_rg_name" {
  source          = "git::https://github.com/cloudposse/terraform-null-label.git?ref=0.25.0"
  name            = var.resource_group_name
  attributes      = [""] # [random_string.generated_seed.result]
  delimiter       = "-"
  id_length_limit = 24
}
