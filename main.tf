# main Terraform file
# Purpose is to deploy a Resource Group to test deployments using TF Cloud
# This is not a Azure lab!
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
    DeployedUsing = "TF Cloud"
  }
}

# need to add Output
