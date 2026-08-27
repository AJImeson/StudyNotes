
variable "prefix" {
  description = "Prefix"
  type        = string
  default     = "k3stest"
}

variable "location" {
  description = "Region"
  type        = string
  default     = "polandcentral"
}

variable "vm_size" {
  description = "VM Sku, K3s Node"
  type        = string
  default     = "Standard_B2as_v2"
}

variable "admin_user" {
  description = "Admin Username"
  type        = string
  default     = "azureuser"
}

variable "vnet_cidr" {
  description = "VN Address space"
  type        = string
  default     = "10.20.0.0/16"
}

variable "subnet_cidr" {
  description = "Node Subnet prefix"
  type        = string
  default     = "10.20.1.0/24"
}

variable "user_ip" {
  description = "Public IP"
  type        = string
  default     = "158.174.22.25/32"
}

variable "node_count" {
  type    = number
  default = 3
}
