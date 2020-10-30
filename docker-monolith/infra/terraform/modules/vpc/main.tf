resource "yandex_vpc_network" "app-network" {
  name = "reddit-app-network"
  labels = {
    tags = "reddit-app-network"
  }
}
resource "yandex_vpc_subnet" "app-subnet" {
  name = "reddit-app-subnet"
  labels = {
    tags = "reddit-app-subnet"
  }
  network_id     = "${yandex_vpc_network.app-network.id}"
  v4_cidr_blocks = ["192.168.10.0/24"]
}
# resource "yandex_vpc_security_group" "group1" {
#   network_id  = "${yandex_vpc_network.app-network.id}"
#   ingress {
#     protocol       = "ANY"
#     port           = 80
#     v4_cidr_blocks = ["0.0.0.0/32"]
#   }
# }
