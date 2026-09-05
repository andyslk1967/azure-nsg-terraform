terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  required_version = ">= 1.3.0"

  backend "azurerm" {
    resource_group_name  = "rg1"
    storage_account_name = "tfstate6422cdc6"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

data "azurerm_resource_group" "rg1" {
  name = "rg1"
}

resource "azurerm_network_security_group" "nsg_port3342" {
  name                = "nsg-allow-port3342"
  location            = data.azurerm_resource_group.rg1.location
  resource_group_name = data.azurerm_resource_group.rg1.name

  security_rule {
    name                         = "AllowPort3342"
    priority                     = 100
    direction                    = "Inbound"
    access                       = "Allow"
    protocol                     = "Tcp"
    source_port_range            = "*"
    destination_port_range       = "3342"
    source_address_prefixes      = var.allowed_source_address_prefixes
    destination_address_prefix   = "*"
  }

  tags = {
    managed_by  = "terraform"
    environment = "production"
  }
}
