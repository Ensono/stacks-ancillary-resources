# Name of the resource group
variable "resource_group_name" {
  type = string
}

# Location of the resources being deployed
variable "location" {
  type = string
}

# Name of the company or project to use in the name
variable "name" {
  type = string
}

variable "container_name" {
  type    = string
  default = "tfstate"
}

# Attributes to use to generate the name of the storage account
variable "attributes" {
  type = list(any)
  default = [
    "state",
  ]
}

# Number of days that the container data should be retained for after
# delettion
variable "retention_days" {
  type    = number
  default = 7
}

# State whether to deploy resource locks to prevent resources from being
# deleted
variable "deploy_locks" {
  type    = bool
  default = true
}

# State whether to generate the name or to use it as is
variable "generate_sa_name" {
  type    = bool
  default = true
}

# State whether to generate the name of the resource group or use as is
variable "generate_rg_name" {
  type    = bool
  default = true
}
