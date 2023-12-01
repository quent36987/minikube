#resource "proxmox_vm_qemu" "HAProxy" {
#  name        = "haproxy"
#  desc        = "HAProxy"
#  target_node = "home"
#
#  agent       = 1
#
#  define_connection_info = true
#  cores                  = 2
#  sockets                = 1
#  cpu                    = "host"
#  scsihw                 = "virtio-scsi-pci"
#  memory                 = 2048
#  bootdisk               = "scsi0"
#
#  clone = "debian11.vm.shiwaforce.com"
#
#  # FIXME mettre sur wan et lan et passer le k3s sur la lan :)
#  network {
#    model  = "virtio"
#    bridge = "vmbr0"
#  }
#
#  os_type   = "cloud-init"
#  ipconfig0 = "ip=192.168.1.200/24,gw=192.168.1.254"
#
#
#  disk {
#    storage = "disksata"
#    size    = "20G"
#    type    = "scsi"
#    slot    = 0
#  }
#
#  ciuser  = "haproxy"
#  sshkeys = <<EOF
#    ${var.ssh_public_keys}
#    EOF
#  # join("\n", var.ssh_public_keys)
#
#  lifecycle {
#    ignore_changes = [
#      network
#    ]
#  }
#
#  tags = "k3sCluster"
#}
