
terraform {
  backend "azurerm" {
    resource_group_name  = "Prakash-devops-vmss"
    storage_account_name = "terraformvmss"
    container_name       = "lbvms"
    key                  = "terraform.tfstate"
  }
}
