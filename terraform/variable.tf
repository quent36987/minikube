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
  default = 3
}

variable "k8s_count" {
  default = 0
}
