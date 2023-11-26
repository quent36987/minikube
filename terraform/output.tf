output "ips" {
  value = ["${proxmox_vm_qemu.srv_1.*.default_ipv4_address}"]
}