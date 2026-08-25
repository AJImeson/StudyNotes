# Variables for test 


variable "nginx_image" {
  description = "Docker image pull"
  type = string
  default = "nginx:latest"
}

variable "container_id" {
  description = "Running container"
  type = string
  default = "test"
}

variable "external_port" {
  description = "Host exposed"
  type = number
  default = 8000
}

variable "ssh_source_address"{
  type = string
} 
