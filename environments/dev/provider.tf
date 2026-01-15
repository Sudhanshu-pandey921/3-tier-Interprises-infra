terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.57.0"
    }
  }
}

provider "azurerm" {
   features {}
   subscription_id = "e2914f52-907f-49e8-885b-a626fc0e1afd"
}