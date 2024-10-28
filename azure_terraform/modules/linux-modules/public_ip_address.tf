
resource "azurerm_public_ip" "my_public_ip" {
  name                = var.public_ip_address
  location            = var.location
  resource_group_name = azurerm_resource_group.my_rg.name
  allocation_method   = "Static"

  tags = var.tags
}
