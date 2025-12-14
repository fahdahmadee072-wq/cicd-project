<<<<<<< HEAD
variable "project" {
=======
variable "project_id" {
>>>>>>> f83be46 (Initial CI/CD project with Terraform, Ansible, and Jenkinsfile)
  type = string
}

variable "region" {
  type = string
}

variable "zone" {
  type = string
}

variable "vm_name" {
<<<<<<< HEAD
  type = string
}

variable "machine_type" {
  type = string
}

variable "image" {
  type = string
}

variable "network" {
=======
  type    = string
  default = "target-vm"
}

variable "machine_type" {
  type    = string
  default = "e2-medium"
}

variable "ssh_user" {
  type    = string
  default = "fahda"
}

variable "ssh_public_key" {
>>>>>>> f83be46 (Initial CI/CD project with Terraform, Ansible, and Jenkinsfile)
  type = string
}

