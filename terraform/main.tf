<<<<<<< HEAD

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
=======
resource "google_compute_instance" "vm" {
  name         = var.vm_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    network = "default"
    access_config {} # public IP
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${var.ssh_public_key}"
  }

  tags = ["ansible-target"]
>>>>>>> f83be46 (Initial CI/CD project with Terraform, Ansible, and Jenkinsfile)
}

