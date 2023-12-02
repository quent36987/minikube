resource "proxmox_vm_qemu" "k8s" {
  count       = var.k8s_count
  name        = "k8s-${count.index}"
  desc        = "k8s-${count.index}"
  target_node = "home"
  agent       = 1

  define_connection_info = true
  cores                  = 2
  sockets                = 1
  cpu                    = "host"
  scsihw                 = "virtio-scsi-pci"
  memory                 = 4096
  bootdisk               = "scsi0"

  clone = "debian11.vm.shiwaforce.com"

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  os_type   = "cloud-init"
  ipconfig0 = "ip=192.168.1.20${count.index}/24,gw=192.168.1.254"


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

  tags = "k8scluster"
}
