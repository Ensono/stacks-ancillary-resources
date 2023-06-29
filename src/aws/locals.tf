locals {
  # This is a map of default tags passed to the provider.
  # This can be extended like adding cost-code or organization name.
  default_tags = {
    Environment = var.name_environment
    Component   = var.name_component
    Project     = var.name_project
    Company     = var.name_company
    Region      = var.region
  }
}
