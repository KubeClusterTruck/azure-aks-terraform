variable "client_id" {}
variable "client_secret" {}
variable "aks_version" {
    default = "1.11.9"
}

variable "ssh_public_key" {
    default = "~/.ssh/id_rsa.pub"
}

variable "dns_prefix" {
    default = "ghtsp-k8s-adv01"
}
variable "vnet_address_space" {
    type = "list"
    default = ["172.10.0.0/16"]
}
variable "cluster_subnet_name" {
    default = "aks-cluster"
}
variable "cluster_subnet_address_prefix" {
    default = "172.10.8.0/22"
}

variable cluster_name {
    default = "k8sadv-01"
}
variable cluster_agent_pool_name {
    default = "agentpool"
}
variable "cluster_agent_count" {
    default = 5
}
variable cluster_agent_fqdn {
    default = ""
}
variable cluster_agent_vm_size {
    default = "Standard_DS1_v2"
}
# For Max Pods, start with 30 or 10 X Agent vCPU Count, whichever is largest
# This Value is constrained by the Cluster Subnet Size, which limits total possible Pods
variable cluster_agent_max_pods {
    default = "30"
}
variable cluster_agent_os_type {
    default = "Linux"
}
variable cluster_agent_os_disk_gb {
    default = "30"
}

variable cluster_linux_admin_username {
    default = "ubuntu"
}
variable cluster_network_plugin {
    default = "azure"
}
variable cluster_docker_bridge_cidr {
    default = ""
}
variable cluster_dns_service_ip {
    default = ""
}
variable cluster_pod_cidr {
    default = ""
}
variable cluster_service_cidr {
    default = ""
}
variable resource_group_name {
    default = "ghtsp-k8sadv01_rg"
}

variable location {
    default = "eastus"
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
