output "redit_subnet" {
  value = yandex_vpc_subnet.app-subnet.id
}
output "addr" {
  value = yandex_vpc_address.addr.external_ipv4_address.0.address
}
