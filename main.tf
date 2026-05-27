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

locals {
  storage_accounts = toset([
    "storageggg0",
    "storageggg1",
    "storageggg2",
    "storageggg3",
    "storageggg4",
    "storageggg5",
    "storageggg6",
    "storageggg7",
    "storageggg8",
    "storageggg9",
    "storageggg10",
    "storageggg11",
    "storageggg12",
    "storageggg13",
    "storageggg14",
    "storageggg15",
    "storageggg16",
    "storageggg17",
    "storageggg18",
    "storageggg19",
  ])
}

resource "azurerm_resource_group" "example" {
  name     = "example-resourcesssss"
  location = "West Europe"
}

resource "azurerm_storage_account" "example" {
  for_each = local.storage_accounts

  name                     = each.value
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}

import {
  to = azurerm_resource_group.example

  id = "/subscriptions/1bf12a70-0903-4a56-9cdb-4c758ec95f2c/resourceGroups/example-resourcesssss"
}

import {
  for_each = local.storage_accounts

  to = azurerm_storage_account.example[each.value]

  id = "/subscriptions/1bf12a70-0903-4a56-9cdb-4c758ec95f2c/resourceGroups/example-resourcesssss/providers/Microsoft.Storage/storageAccounts/${each.value}"
}
