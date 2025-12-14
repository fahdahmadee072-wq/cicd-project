variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "zone" {
  type = string
}

variable "vm_name" {
  type    = string
  default = "ansible-target"
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
  type = string
}

