terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.2-rc04"  # ajuste conforme sua versão
    }
  }
}

provider "proxmox" {
  pm_api_url      = "http://localhost:8006/api2/json" 
  pm_user         = ""
  pm_password     = ""
  pm_tls_insecure = true
}

# Definindo as VMs e seus papéis
variable "vms" {
  default = {
    control-plane = { name = "control-plane", cores = 2, memory = 2048 }
    worker-1      = { name = "worker-1",      cores = 2, memory = 2048 }
    worker-2      = { name = "worker-2",      cores = 2, memory = 2048 }
    worker-3      = { name = "worker-3",      cores = 2, memory = 2048 }
  }
}

resource "proxmox_vm_qemu" "cluster_vms" {
  for_each    = var.vms
  name        = each.value.name
  target_node = "hb"
  clone       = "Template"   # nome do template Proxmox
  

  cores   = each.value.cores
  sockets = 1
  memory  = each.value.memory
  scsihw  = "virtio-scsi-pci"
  bootdisk    = "scsi0"


 
  network {
    id = 0
    model  = "virtio"
    bridge = "vmbr0"
  }
}
