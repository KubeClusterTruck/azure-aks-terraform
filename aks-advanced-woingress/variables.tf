variable "client_id" {}
variable "client_secret" {}

variable "agent_count" {
    default = 5
}
variable "aks_version" {
    default = "1.11.9"
}

variable "ssh_public_key" {
    default = "~/.ssh/id_rsa.pub"
}

variable "dns_prefix" {
    default = "ghtsp-k8s-adv01"
}

variable cluster_name {
    default = "k8sadv-01"
}

variable resource_group_name {
    default = "ghtsp-k8sadv01_rg"
}

variable location {
    default = "Central US"
}

variable log_analytics_workspace_name {
    default = "ghstp-k8sadv01-lawks"
}

# refer https://azure.microsoft.com/global-infrastructure/services/?products=monitor for log analytics available regions
variable log_analytics_workspace_location {
    default = "eastus"
}

# refer https://azure.microsoft.com/pricing/details/monitor/ for log analytics pricing 
variable log_analytics_workspace_sku {
    default = "Standalone"
}
