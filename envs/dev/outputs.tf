# envs/dev/outputs.tf
output "vm_internal_ip" {
  value = module.vm_compute.instance_internal_ip
}
