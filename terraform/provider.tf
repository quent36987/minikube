terraform {
  required_version = ">= 0.13.0"

  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.9.11"
    }
  }

  backend "local" {
    path = "./states/terraform.tfstate"
  }
}

#### SENSITIVE VARIABLES ####

variable "proxmox_api_token_id" {
  type      = string
  sensitive = true
}

variable "proxmox_api_token_secret" {
  type      = string
  sensitive = true
}

variable "ssh_public_keys" {
  type      = list(string)
  sensitive = true
}

#### NON-SENSITIVE VARIABLES ####

variable "proxmox_api_url" {
  type = string
}

variable "agent-k3s_count" {
  default = 0
}
variable "server-k3s_count" {
  default = 0
}
variable "k8s_count" {
  default = 3
}

provider "proxmox" {
  pm_api_url          = var.proxmox_api_url
  pm_api_token_id     = var.proxmox_api_token_id
  pm_api_token_secret = var.proxmox_api_token_secret

  pm_tls_insecure = true

  pm_log_enable = true
  pm_log_file   = "terraform-plugin-proxmox.log"
  pm_debug      = true
  pm_log_levels = {
    _default    = "debug"
    _capturelog = ""
  }
}
