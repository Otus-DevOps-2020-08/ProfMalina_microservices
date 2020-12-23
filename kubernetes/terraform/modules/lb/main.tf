resource "yandex_lb_target_group" "kubernetes-target-pool" {
  name = "kubernetes-target-pool"

  dynamic "target" {
    # for_each = yandex_compute_instance.controller.*.network_interface.0.ip_address
    for_each = var.internal_ip_address_controller
    content {
      subnet_id = var.subnet_id
      address   = target.value
    }
  }
}

resource "yandex_lb_network_load_balancer" "kubernetes-forwarding-rule" {
  name = "kubernetes-forwarding-rule"

  listener {
    name = "listener-kubernetes"
    port = 6443
    external_address_spec {
      ip_version = "ipv4"
      address=var.external_ip
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.kubernetes-target-pool.id

    healthcheck {
      name = "http"
      http_options {
        port = 80
        path = "/healthz"
      }
    }
  }
}
