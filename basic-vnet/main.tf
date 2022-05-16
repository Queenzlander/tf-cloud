# main Terraform file
# Purpose is to deploy a VNet with a couple of Subnets
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

#create VNET and associated resources
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.prefix}-vnet"
  location            = azurerm_resource_group.myresourcegroup.location
  address_space       = [var.vnet_prefix]
  resource_group_name = azurerm_resource_group.myresourcegroup.name
}

resource "azurerm_subnet" "gatewaysubnet" {
  name                 = "GatewaySubnet" #mandated name
  resource_group_name  = azurerm_resource_group.myresourcegroup.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet1_prefix[0]]
}

resource "azurerm_subnet" "subnet1" {
  name                 = "${var.prefix}-subnet-01"
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = azurerm_resource_group.myresourcegroup.name
  address_prefixes     = [var.subnet1_prefix[1]]
}

resource "azurerm_route_table" "rt1" {
  name                = "${var.prefix}-route-table-01"
  location            = azurerm_resource_group.myresourcegroup.location
  resource_group_name = azurerm_resource_group.myresourcegroup.name

  tags = {
    DeployedUsing = "Terraform"
  }
}
