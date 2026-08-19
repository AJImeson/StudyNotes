
data "azurerm_platform_image" "ajtest" {
  location  = azurerm_resource_group.ajtest.location
  publisher = "Debian"
  offer     = "debian-11"
  sku       = "11"
}

resource "azurerm_resource_group" "ajtest" {
  name     = "ajtest-resources"
  location = "polandcentral"
}

resource "azurerm_virtual_network" "ajtest" {
  name                = "ajtest-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.ajtest.location
  resource_group_name = azurerm_resource_group.ajtest.name
}

resource "azurerm_subnet" "ajtest" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.ajtest.name
  virtual_network_name = azurerm_virtual_network.ajtest.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "ajtest" {
  name                = "ajtest-nic"
  location            = azurerm_resource_group.ajtest.location
  resource_group_name = azurerm_resource_group.ajtest.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.ajtest.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "ajtest" {
  name                = "ajtest-machine"
  resource_group_name = azurerm_resource_group.ajtest.name
  location            = azurerm_resource_group.ajtest.location
  size                = "Standard_B2as_v2"
  admin_username      = "aj"
  network_interface_ids = [
    azurerm_network_interface.ajtest.id,
  ]

  admin_ssh_key {
    username   = "aj"
    public_key = file("~/.ssh/id_ed25519.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = data.azurerm_platform_image.ajtest.publisher
    offer     = data.azurerm_platform_image.ajtest.offer
    sku       = data.azurerm_platform_image.ajtest.sku
    version   = data.azurerm_platform_image.ajtest.version
  }
}
