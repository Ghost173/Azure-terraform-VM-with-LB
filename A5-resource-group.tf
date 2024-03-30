
resource "azurerm_resource_group" "rg" {
  name     = "${var.business_division}-${var.resource_group_name}-${random_string.myrandom.id}"
  location = var.resource_group_location
  tags = {
    environment = "terraform"
    owners      = "Prakash"
    source      = "azuredevops"
  }
}
