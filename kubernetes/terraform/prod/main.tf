provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}
module "vpc" {
  source           = "../modules/vpc"
  # public_key_path  = var.public_key_path
  # private_key_path = var.private_key_path
}
module "kuber" {
  source                   = "../modules/kuber"
  network_id               = module.vpc.redit_net
  service_account_key_id = var.service_account_key_id
  subnet_id                = module.vpc.redit_subnet
}
