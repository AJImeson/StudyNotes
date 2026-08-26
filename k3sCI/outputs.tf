
output "public_ip" {
  value = azurerm_public_ip.k3stest[*].ip_address
}

output "ssh" {
  value = [
    for ip in azurerm_public_ip.k3stest[*].ip_address:
    "ssh ${var.admin_user}@${ip}"
  ]
}

output "private_ips" {
  value = azurerm_network_interface.k3stest[*].private_ip_address
}
