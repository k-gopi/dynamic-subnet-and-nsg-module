terraform {

  backend "azurerm" {

    resource_group_name  = "fis-uat-tfstate-rg"
    storage_account_name = "fisuattfstate"
    container_name       = "tfstate"
    key                  = "fis-uat.tfstate"

  }

}