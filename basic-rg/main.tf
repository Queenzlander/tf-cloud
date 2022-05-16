# main Terraform file
# Purpose is to deploy a Resource Group
# NZDR, May 2022

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.60.0"
    }
  }
}

provider "azurerm" {
  features {}
}

#create Resource Group for deployment
resource "azurerm_resource_group" "myresourcegroup" {
  name     = var.rg_name
  location = var.location

  tags = {
    DeployedUsing = "Terraform"
  }
}

# need to add Output
