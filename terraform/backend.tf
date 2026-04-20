terraform {
  backend "azurerm" {
    resource_group_name  = "cst8918-final-project-backend-rg"
    storage_account_name = "pate1595tfstate07"
    container_name       = "tfstate"
    key                  = "final-project.tfstate"
  }
}