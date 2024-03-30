
terraform {
  required_version = ">=1.0.0"

  required_providers {
    #Azure providers
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }

    #Random providers
    random = {
      source  = "hashicorp/random"
      version = ">=3.0" #current3.6.0
    }
  }
}



# provider Block
provider "azurerm" {
  features {

  }
}
