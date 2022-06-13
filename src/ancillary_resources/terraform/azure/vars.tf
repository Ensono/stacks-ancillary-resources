# Location of the resources being deployed
variable "location" {
  type = string
}

# Name of the resource group
variable "resource_group_name" {
  type    = string
  default = ""
}

# Name of the company for which the resources are being deployed
variable "company_name" {
  type = string
}

# DNS --------------------------------------

# Specify the dns zones that need to be created
variable "dns_zones" {
  type = object({
    public  = list(string)
    private = list(string)
  })

  default = {
    public  = []
    private = []
  }

  validation {
    condition     = (length(var.dns_zones["private"]) == 0 || length(var.dns_zones["private"]) == length(var.dns_zones["public"]))
    error_message = "There must be the same number of private DNS zones as public ones, or none specified at all, in which case they will be derived."
  }
}

# LOG ANALYTICS ----------------------------
# State wteher to deploy Log Analytics
variable "deploy_log_analytics" {
  type    = bool
  default = true
}

# Set the SKu for the LA workspace
variable "log_analytics_sku" {
  type    = string
  default = "PerGB2018"
}

variable "log_analytics_retention" {
  type    = number
  default = 30
}

# KEY VAULT --------------------------------
variable "key_vault_instances" {
  type = object({
    nonprod = string
    prod    = string
  })

  default = {
    nonprod = ""
    prod    = ""
  }
}

variable "key_vault_sku" {
  type    = string
  default = "standard"
}

variable "key_vault_secret_perms" {
  type    = list(string)
  default = ["Get", "List"]
}

variable "key_vault_key_perms" {
  type    = list(string)
  default = []
}

variable "key_vault_cert_perms" {
  type    = list(string)
  default = []
}

variable "key_vault_storage_perms" {
  type    = list(string)
  default = []
}

# CONTAINER REGISTRY -----------------------
variable "container_registry" {
  type    = bool
  default = true
}

variable "container_registry_admin" {
  type    = bool
  default = true
}

variable "container_registry_sku" {
  type    = string
  default = "Standard"
}

# NAMING -----------------------------------
# List of attributes to give to the default name module
variable "attributes" {
  default = []
}

variable "tags" {
  type    = map(string)
  default = {}
}

# The suffix to add to the public dns zone to specify the Internal
# zone if none have been specified
variable "internal_domain_suffix" {
  type        = string
  description = "Internal domain suffix to apply to publix dns zones if no private zones are spoecified"
  default     = "internal"
}
