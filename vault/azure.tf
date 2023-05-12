resource "azurerm_storage_account" "example" {
  name                     = "ex0713lrsk112"
  resource_group_name      = "testka"
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}