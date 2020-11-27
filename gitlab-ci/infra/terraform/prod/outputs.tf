output "external_ip_address_gitlab" {
  value = module.gitlab.external_ip_address_gitlab
}

### The Ansible inventory file
resource "local_file" "AnsibleInventory" {
  content = templatefile("inventory.tmpl",
    {
      name_gitlab                = module.gitlab.name_gitlab,
      external_ip_address_gitlab = module.gitlab.external_ip_address_gitlab,
    }
  )
  filename = "../../ansible/environments/prod/inventory"
}
