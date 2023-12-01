resource "proxmox_vm_qemu" "server-k3s" {
  count       = var.server-k3s_count
  name        = "server-k3s-${count.index + 1}"
  desc        = "server-k3s-${count.index + 1}"
  target_node = "home"
  #vmid        = "80${count.index + 1}"
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
  ipconfig0 = "ip=192.168.1.20${count.index + 1}/24,gw=192.168.1.254"


  disk {
    storage = "disksata"
    size    = "32G"
    type    = "scsi"
    slot    = 0
  }

  ciuser  = "server"
  sshkeys = <<EOF
    ${var.ssh_public_keys}
    EOF

  lifecycle {
    ignore_changes = [
      network
    ]
  }

  tags = "k3sCluster"

}
