<<<<<<< HEAD
output "vm_name" {
  value = module.myvm.vm_name
}

output "public_ip" {
  value = module.myvm.public_ip
=======
output "vm_public_ip" {
  value = google_compute_instance.vm.network_interface[0].access_config[0].nat_ip
>>>>>>> f83be46 (Initial CI/CD project with Terraform, Ansible, and Jenkinsfile)
}

