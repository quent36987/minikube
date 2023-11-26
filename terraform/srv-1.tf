resource "proxmox_vm_qemu" "srv_1" {
  name        = "srv1"
  desc        = "srv1"
  target_node = "home"
  vmid        = "301"

  agent                  = 1
  define_connection_info = true
  cores                  = 2
  sockets                = 1
  cpu                    = "host"
  scsihw                 = "virtio-scsi-pci"
  memory                 = 2048
  bootdisk               = "scsi0"

  clone = "debian11.vm.shiwaforce.com"

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  os_type   = "cloud-init"
  ipconfig0 = "ip=dhcp"

  disk {
    storage = "disksata"
    size    = "20G"
    type    = "scsi"
    slot    = 0
  }

  ciuser  = "terraform"
  sshkeys = <<EOF
  ${var.ssh_public_key}
  EOF

  #    os_type = "cloud-init"
  #    ipconfig0 = "ip="
  lifecycle {
    ignore_changes = [
      network
    ]
  }
}