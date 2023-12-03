resource "proxmox_vm_qemu" "agent-k3s" {
  count       = var.agent-k3s_count
  name        = "agent-k3s-${count.index}"
  desc        = "agent-k3s-${count.index}"
  target_node = "home"
  agent       = 1

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
  ipconfig0 = "ip=192.168.1.21${count.index}/24,gw=192.168.1.254"


  disk {
    storage = "disksata"
    size    = "32G"
    type    = "scsi"
    slot    = 0
  }

  ciuser  = "root"
  sshkeys = <<EOF
    ${join("\n", var.ssh_public_keys)}
    EOF

  lifecycle {
    ignore_changes = [
      network
    ]
  }

  tags = "k3sCluster"
}
