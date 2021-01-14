provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}
module "vpc" {
  source = "../modules/vpc"
}
module "kuber" {
  source                 = "../modules/kuber"
  network_id             = module.vpc.redit_net
  service_account_key_id = var.service_account_key_id
  subnet_id              = module.vpc.redit_subnet
}
