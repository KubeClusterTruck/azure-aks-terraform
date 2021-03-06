variable "client_id" {}
variable "client_secret" {}

variable "agent_count" {
    default = 5
}
variable "aks_version" {
    default = "1.11.8"
}

variable "ssh_public_key" {
    default = "~/.ssh/id_rsa.pub"
}

variable "dns_prefix" {
    default = "ghtsp-k8sbasic"
}

variable cluster_name {
    default = "k8sbasic"
}

variable resource_group_name {
    default = "tftest-k8sbasic"
}

variable location {
    default = "Central US"
}

variable log_analytics_workspace_name {
    default = "tftest-k8sbasic-lawks"
}

# refer https://azure.microsoft.com/global-infrastructure/services/?products=monitor for log analytics available regions
variable log_analytics_workspace_location {
    default = "eastus"
}

# refer https://azure.microsoft.com/pricing/details/monitor/ for log analytics pricing 
variable log_analytics_workspace_sku {
    default = "Standalone"
}
