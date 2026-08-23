
data "azurerm_platform_image" "ajtest" {
  location  = azurerm_resource_group.ajtest.location
  publisher = "Debian"
  offer     = "debian-11"
  sku       = "11"
}

#data "cloudinit_config" "config"{
  #  gzip          = true
  #  base64_encode = true

  #  part {
    #    filename      = "init.sh"
    #    content_type  = "text/x-shellscript"
    #    content       = file("${path.module}/scripts/provision_basic.sh")
    #  }

  # part {
    #   content_type  = "text/cloud-config"
    #    content       = file("${path.module}/scripts/init.yaml")
    # }
  #}

resource "azurerm_network_security_group" "ajtest"{
  name                = "ajtest-nsg"
  location            = azurerm_resource_group.ajtest.location
  resource_group_name = azurerm_resource_group.ajtest.name

  security_rule {
    name                        = "SSH"
    priority                    = 1001
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "22"
    source_address_prefix       = var.source_address
    destination_address_prefix  = "*"
  }
}

resource "azurerm_network_interface_security_group_association" "ajtest" {
  network_interface_id          = azurerm_network_interface.ajtest.id
  network_security_group_id     = azurerm_network_security_group.ajtest.id  
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
  address_prefixes     = [cidrsubnet(tolist(azurerm_virtual_network.ajtest.address_space)[0], 8, 2)]
}

resource "azurerm_public_ip" "ajtest"{
  name                 = "ajtest-ip"
  location             = azurerm_resource_group.ajtest.location
  resource_group_name  = azurerm_resource_group.ajtest.name
  allocation_method    = "Static"
}

resource "azurerm_network_interface" "ajtest" {
  name                = "ajtest-nic"
  location            = azurerm_resource_group.ajtest.location
  resource_group_name = azurerm_resource_group.ajtest.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.ajtest.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.ajtest.id
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
