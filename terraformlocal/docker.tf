
resource "docker_image" "nginx" {
  name = var.nginx_image 
}

resource "docker_container" "nginx" {
  name = "local-docker-container"
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = 8000
  }
}
