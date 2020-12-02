output "external_ip_address_docker" {
  value = module.docker.external_ip_address_docker
}

### The Ansible inventory file
resource "local_file" "AnsibleInventory" {
  content = templatefile("inventory.tmpl",
    {
      name_docker                = module.docker.name_docker,
      external_ip_address_docker = module.docker.external_ip_address_docker,
    }
  )
  filename = "../../ansible/environments/prod/inventory"
}
