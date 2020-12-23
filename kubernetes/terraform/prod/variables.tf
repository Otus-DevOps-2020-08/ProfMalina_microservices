variable cloud_id {
  description = "Cloud"
}
variable folder_id {
  description = "Folder"
}
variable zone {
  description = "Zone"
  default     = "ru-central1-a"
}
variable public_key_path {
  description = "Path to the public key used for ssh access"
}
variable image_id {
  description = "Disk image"
}
variable service_account_key_file {
  description = "key.json"
}
variable private_key_path {
  description = "Path to the private key used for connection"
}
variable instsnce_count {
  description = "Count instance"
  default     = 3
}
variable access_key {
  description = "Access key bucket account"
}
variable secret_key {
  description = "Secret key bucket account"
}
