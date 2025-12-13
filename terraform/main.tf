
terraform {
  backend "gcs" {
    bucket = "fahd-terraform-state-bucket"
    prefix = "terraform/state"
  }
}

# -----------------------
# Provider block
# -----------------------
provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

# -----------------------
# Call the VM module
# -----------------------
module "myvm" {
  source        = "./modules/vm"
  name          = var.vm_name
  machine_type  = var.machine_type
  image         = var.image
  network       = var.network
}

