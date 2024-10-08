# main.tf

provider "azurerm" {
  features {}
}

locals {
  apim_name = "${var.prefix}-apim"
  resource_group_name = "${var.prefix}-apim-rg"
}

resource "azurerm_resource_group" "rg" {
  name     = local.resource_group_name
  location = var.location
}

module "apim" {
  source              = "./modules/apim"
  apim_name           = local.apim_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  publisher_name      = var.publisher_name
  publisher_email     = var.publisher_email
  sku_name            = var.sku_name
  api_name            = var.api_name
  api_display_name    = var.api_display_name
  api_path            = var.api_path
}

