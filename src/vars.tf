
# Define the name of the resource group
variable "resource_group_name" {
    type = string
    default = "Stacks-Ancillary-Resources"
}

# Location of the resources being deployed
variable "location" {
    type = string
    default = "westeu"
}

variable "sa_name" {
    type = string
    default = "amidostackstfstate"
}

variable "sa_container" {
    type = string
    default = "tfstate"
}

# The name of the Key Vault to be deployed
variable "key_vault_name_nonprod" {
    type = string
    default = "stacks-nonprod-kv"
}

variable "key_vault_name_prod" {
    type = string
    default = "stacks-prod-kv"
}

# THe SKU of the key vault to use
variable "key_vault_sku" {
    type = string
    default = "standard"
}

# The name of the Log Analytics workspace to be deployed
variable "la_name" {
    type = string
    default = "stacks-la"
}

variable "la_sku" {
    type = string
    default = "PerGB2018"
}

variable "la_retention" {
    type = number
    default = 30
}

# The tenant ID and object ID of the app that should have access
# to the Key Vault
variable "app_tenant_id" {
    type = string
}

variable "app_object_id" {
    type = string
}

variable "app_application_id" {
    type = string
}

# The dns zones that should be deployed
variable "dns_zones" {
    type = list
    default = [
    ]
}

variable "dns_zones_private" {
    type = list
    default = [
    ]
}
