terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}


# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id = "9bdcf4b4-52de-406b-8496-a99b4a768f7c"
  skip_provider_registration = true
}

