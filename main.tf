terraform {
  cloud {

    organization = "georgi-berchev"

    workspaces {
      name = "UI-import-issue"
    }
  }
}

provider "azurerm" {
  resource_provider_registrations = "none"
  features {}
}
