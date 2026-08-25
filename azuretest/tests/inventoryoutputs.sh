#!/usr/bin/env bash

# Collect static inventory from Terraform script example

cd terraform/ 

# Outputs

WEB_IPS=$(terraform output -json web_server_ips | jq '.[]')
DB_IP=$(terraform output -raw db_server_ip)
LB_DNS=$(terraform output -raw lb_dns_name)

cat > ../ansible/inventory/dynamic.ini << EOF

[webservers]
$(echo"$WEB_IPS" | while read ip;do echo"$ip ansible_user=ubuntu";done)

[dbservers]
$DB_IP ansible_user=ubuntu

[all:vars]
ansible_ssh_private_key_file=~/.ssh/id_ed25519
lb_dns_name=$LB_DNS
EOF

echo "Inventory generated"
