resource "proxmox_vm_qemu" "agent-k3s" {
  count       = var.agent-k3s_count
  name        = "agent-k3s-${count.index + 1}"
  desc        = "agent-k3s-${count.index + 1}"
  target_node = "home"
  vmid        = "80${count.index + 1}"
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

  ciuser  = "agent"
  sshkeys = <<EOF
    ${var.ssh_public_key}
    EOF

  lifecycle {
    ignore_changes = [
      network
    ]
  }

  tags = "agent-k3s"

}
#
#resource "proxmox_vm_qemu" "worker_nodes" {
#  count       = var.worker_count
#  name        = "k8s-worker-${count.index + 1}"
#  desc        = "k8s-worker-${count.index + 1}"
#  target_node = "home"
#  vmid        = "90${count.index + 1}"
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
#  network {
#    model  = "virtio"
#    bridge = "vmbr0"
#  }
#
#  os_type   = "cloud-init"
#  ipconfig0 = "ip=dhcp"
#
#  disk {
#    storage = "disksata"
#    size    = "20G"
#    type    = "scsi"
#    slot    = 0
#  }
#
#  ciuser  = "terraform"
#  sshkeys = <<EOF
#    ${var.ssh_public_key}
#    EOF
#
#  lifecycle {
#    ignore_changes = [
#      network
#    ]
#  }
#
#
#  tags = "k8s-worker"
#
#}