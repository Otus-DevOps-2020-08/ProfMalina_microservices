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
module "gitlab" {
  source            = "../modules/gitlab"
  public_key_path   = var.public_key_path
  gitlab_disk_image = var.gitlab_disk_image
  subnet_id         = module.vpc.redit_subnet
  private_key_path  = var.private_key_path
}
