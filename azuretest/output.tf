output "public_ip" {
  value = resource.azurerm_public_ip.ajtest.ip_address
}
