output "external_ip_address_controller" {
  value = yandex_compute_instance.controller.*.network_interface.0.nat_ip_address
}
output "internal_ip_address_controller" {
  value = yandex_compute_instance.controller.*.network_interface.0.ip_address
}
output "name_controller" {
  value = yandex_compute_instance.controller.*.name
}
