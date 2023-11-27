#output "ips" {
#  value = ["${proxmox_vm_qemu.srv_1.*.default_ipv4_address}"]
#}

output "master_ips" {
  value = ["${proxmox_vm_qemu.master_nodes.*.default_ipv4_address}"]
}

output "worker_ips" {
  value = ["${proxmox_vm_qemu.worker_nodes.*.default_ipv4_address}"]
}