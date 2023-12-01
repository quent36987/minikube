output "agent-k3s" {
  value = ["${proxmox_vm_qemu.agent-k3s.*.default_ipv4_address}"]
}

output "server-k3s" {
  value = ["${proxmox_vm_qemu.server-k3s.*.default_ipv4_address}"]
}
