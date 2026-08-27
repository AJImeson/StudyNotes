
output "public_ip" {
  value = azurerm_public_ip.k3stest[*].ip_address
}

output "private_ips" {
  value = azurerm_network_interface.k3stest[*].private_ip_address
}

output "ssh" {
  value = [
    for ip in azurerm_public_ip.k3stest[*].ip_address :
    "ssh ${var.admin_user}@${ip}"
  ]
}

output "server_ip" {
  value = azurerm_public_ip.k3stest[0].ip_address
}

output "server_private_ip" {
  value = azurerm_network_interface.k3stest[0].private_ip_address
}

output "k3s_token" {
  value     = random_password.k3s_token.result
  sensitive = true
}
