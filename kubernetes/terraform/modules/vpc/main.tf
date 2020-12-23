resource "yandex_vpc_network" "app-network" {
  name = "kubernetes-the-hard-way"
  labels = {
    tags = "kubernetes-the-hard-way"
  }
}
resource "yandex_vpc_route_table" "lab-rt-a" {
  network_id = "${yandex_vpc_network.app-network.id}"
  count = 3

  static_route {
    # name="kubernetes-route-10-200-${count.index}-0-24"
    destination_prefix = "10.200.${count.index}.0/24"
    next_hop_address   = "10.240.0.2${count.index}"
  }
}
resource "yandex_vpc_subnet" "app-subnet" {
  name = "kubernetes"
  labels = {
    tags = "kubernetes"
  }
  network_id     = "${yandex_vpc_network.app-network.id}"
  v4_cidr_blocks = ["10.240.0.0/24"]
}
resource "yandex_vpc_address" "addr" {
  name = "kubernetes-the-hard-way"

  external_ipv4_address {
    zone_id = "ru-central1-a"
  }
}
