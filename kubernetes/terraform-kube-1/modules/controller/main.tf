resource "yandex_compute_instance" "controller" {
  count = var.instsnce_count
  name  = "controller-${count.index}"
  hostname  = "controller-${count.index}"
  labels = {
    tags = "controller-${count.index}"
  }
  resources {
    cores  = 2
    memory = 4
  }
  boot_disk {
    initialize_params {
      # image-folder-id=standard-images
      # image-family=ubuntu-2004-lts
      image_id = var.image_id
      size=50
    }
  }
  network_interface {
    subnet_id = var.subnet_id
    nat       = true
    ip_address="10.240.0.1${count.index}"
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
