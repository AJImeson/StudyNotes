data "azurerm_platform_image" "ubuntu" {
  location  = var.location
  publisher = "Canonical"
  offer     = "ubuntu-24_04-lts"
  sku       = "server"
}


resource "azurerm_resource_group" "k3stest" {
  name     = "${var.prefix}-rg"
  location = var.location
}

resource "azurerm_virtual_network" "k3stest" {
  name                = "${var.prefix}-vnet"
  address_space       = [var.vnet_cidr]
  location            = azurerm_resource_group.k3stest.location
  resource_group_name = azurerm_resource_group.k3stest.name
}

resource "azurerm_subnet" "k3stest" {
  name                 = "${var.prefix}-subnet"
  resource_group_name  = azurerm_resource_group.k3stest.name
  virtual_network_name = azurerm_virtual_network.k3stest.name
  address_prefixes     = [var.subnet_cidr]
}

resource "azurerm_public_ip" "k3stest" {
  count               = var.node_count
  name                = "${var.prefix}node${count.index}"
  location            = azurerm_resource_group.k3stest.location
  resource_group_name = azurerm_resource_group.k3stest.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_network_security_group" "k3stest" {
  name                = "${var.prefix}-nsg"
  location            = azurerm_resource_group.k3stest.location
  resource_group_name = azurerm_resource_group.k3stest.name

  security_rule {
    name                       = "SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = var.user_ip
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "K8sAPI"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "6443"
    source_address_prefix      = var.user_ip
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface" "k3stest" {
  count               = var.node_count
  name                = "${var.prefix}node${count.index}"
  location            = azurerm_resource_group.k3stest.location
  resource_group_name = azurerm_resource_group.k3stest.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.k3stest.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.k3stest[count.index].id
  }
}

resource "azurerm_network_interface_security_group_association" "k3stest" {
  count                     = var.node_count
  network_interface_id      = azurerm_network_interface.k3stest[count.index].id
  network_security_group_id = azurerm_network_security_group.k3stest.id
}

resource "azurerm_linux_virtual_machine" "k3stest" {
  count                           = var.node_count
  name                            = "${var.prefix}node${count.index}"
  resource_group_name             = azurerm_resource_group.k3stest.name
  location                        = azurerm_resource_group.k3stest.location
  size                            = var.vm_size
  admin_username                  = var.admin_user
  disable_password_authentication = true
  network_interface_ids           = [azurerm_network_interface.k3stest[count.index].id]

  admin_ssh_key {
    username   = var.admin_user
    public_key = file("~/.ssh/id_ed25519.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = data.azurerm_platform_image.ubuntu.publisher
    offer     = data.azurerm_platform_image.ubuntu.offer
    sku       = data.azurerm_platform_image.ubuntu.sku
    version   = data.azurerm_platform_image.ubuntu.version
  }

  lifecycle {
    ignore_changes = [source_image_reference]
  }
}
