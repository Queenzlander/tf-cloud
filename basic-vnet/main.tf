# main Terraform file
# Purpose is to deploy a VNet
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

# Need to update to input RG from other deploy

#create VNET and associated resources
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.prefix}-vnet"
  location            = azurerm_resource_group.myresourcegroup.location
  address_space       = [var.vnet_prefix]
  resource_group_name = azurerm_resource_group.myresourcegroup.name
}

# Output VNet details for use bu other
