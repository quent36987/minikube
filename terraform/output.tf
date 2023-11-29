#output "ips" {
#  value = ["${proxmox_vm_qemu.srv_1.*.default_ipv4_address}"]
#}

output "agent-k3s" {
  value = ["${proxmox_vm_qemu.agent-k3s.*.default_ipv4_address}"]
}
