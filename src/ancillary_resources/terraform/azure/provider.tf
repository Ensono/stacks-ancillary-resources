terraform {
    required_providers {
        azurerm = {}
    }

    backend "azurerm" {}
}

provider "azurerm" {
    features {}
}