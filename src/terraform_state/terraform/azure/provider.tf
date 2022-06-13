terraform {
  required_providers {
    azurerm = {}
  }

  backend "local" {}
}

provider "azurerm" {
  features {}
}
