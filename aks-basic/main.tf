provider "azurerm" {
    version = "~>1.5"
}

terraform {
    backend "azurerm" {
    storage_account_name = "ghtsp2terraform"
    container_name       = "tfstate"
    key                  = "k8s-basic"
  }
}
