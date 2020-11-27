variable public_key_path {
  description = "Path to the public key used for ssh access"
}
variable docker_disk_image {
  description = "Disk image for docker"
  default     = "reddit-app-base"
}
variable subnet_id {
  description = "Subnets for modules"
}
variable private_key_path {
  description = "private_key_path"
}
variable instsnce_count {
  description = "Count instance"
  default     = 1
}
