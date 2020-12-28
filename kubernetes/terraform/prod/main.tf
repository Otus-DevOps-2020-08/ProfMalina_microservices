provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}
module "vpc" {
  source           = "../modules/vpc"
  public_key_path  = var.public_key_path
  private_key_path = var.private_key_path
}
module "controller" {
  source            = "../modules/controller"
  public_key_path   = var.public_key_path
  subnet_id         = module.vpc.redit_subnet
  private_key_path  = var.private_key_path
  image_id = var.image_id
}
module "worker" {
  source            = "../modules/worker"
  public_key_path   = var.public_key_path
  subnet_id         = module.vpc.redit_subnet
  private_key_path  = var.private_key_path
  image_id = var.image_id
}
module "lb" {
  source            = "../modules/lb"
  subnet_id         = module.vpc.redit_subnet
  external_ip = module.vpc.addr
  internal_ip_address_controller = module.controller.internal_ip_address_controller
}
