provider "azurerm" {
    version = "~>1.5"
}

terraform {
    backend "azurerm" {
    key = "k8s-advance-woi"
  }
}
