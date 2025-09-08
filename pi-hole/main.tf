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



resource "proxmox_vm_qemu" "cluster_vms" {
  name        = "Pi-Hole"
  target_node = "hb"
  clone       = "Template"   # nome do template Proxmox
  

  cores   = 2
  sockets = 1
  memory  = 2048
  scsihw  = "virtio-scsi-pci"
  bootdisk    = "scsi0"


 
  network {
    id = 0
    model  = "virtio"
    bridge = "vmbr0"
  }
}
