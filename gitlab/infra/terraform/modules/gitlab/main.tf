resource "yandex_compute_instance" "gitlab" {
  count = var.instsnce_count
  name  = "reddit-docker-${count.index}"
  labels = {
    tags = "reddit-docker-${count.index}"
  }
  resources {
    cores  = 2
    memory = 4
  }
  boot_disk {
    initialize_params {
      size = 50
      image_id = var.gitlab_disk_image
    }
  }
  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }
  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }
  connection {
    type        = "ssh"
    host        = self.network_interface.0.nat_ip_address
    user        = "ubuntu"
    agent       = false
    private_key = file(var.private_key_path)
  }
}
