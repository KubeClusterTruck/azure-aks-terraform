resource "azurerm_resource_group" "k8s-advanced-woi" {
    name     = "${var.resource_group_name}"
    location = "${var.location}"
}
resource "azurerm_virtual_network" "k8s-advanced-woi" {
  name                = "${var.prefix}-network"
  location            = "${azurerm_resource_group.k8s-advanced-woi.location}"
  resource_group_name = "${azurerm_resource_group.k8s-advanced-woi.name}"
  address_space       = ["172.10.0.0/16"]
}
resource "azurerm_subnet" "k8s-advanced-woi" {
  name                 = "aks-internal01"
  resource_group_name  = "${azurerm_resource_group.k8s-advanced-woi.name}"
  address_prefix       = "172.10.10.0/22"
  virtual_network_name = "${azurerm_virtual_network.k8s-advanced-woi.name}"
}
resource "azurerm_log_analytics_workspace" "k8s-advanced-woi" {
    name                = "${var.log_analytics_workspace_name}"
    location            = "${var.log_analytics_workspace_location}"
    resource_group_name = "${azurerm_resource_group.k8s-advanced-woi.name}"
    sku                 = "${var.log_analytics_workspace_sku}"
}
resource "azurerm_log_analytics_solution" "k8s-advanced-woi" {
    solution_name         = "ContainerInsights"
    location              = "${azurerm_log_analytics_workspace.k8s-advanced-woi.location}"
    resource_group_name   = "${azurerm_resource_group.k8s-advanced-woi.name}"
    workspace_resource_id = "${azurerm_log_analytics_workspace.k8s-advanced-woi.id}"
    workspace_name        = "${azurerm_log_analytics_workspace.k8s-advanced-woi.name}"

    plan {
        publisher = "Microsoft"
        product   = "OMSGallery/ContainerInsights"
    }
}
resource "azurerm_kubernetes_cluster" "k8s-advanced-woi" {
    name                = "${var.cluster_name}"
    location            = "${azurerm_resource_group.k8s-advanced-woi.location}"
    resource_group_name = "${azurerm_resource_group.k8s-advanced-woi.name}"
    dns_prefix          = "${var.dns_prefix}"
    kubernetes_version  = "${var.aks_version}"

    linux_profile {
        admin_username = "ubuntu"

        ssh_key {
            key_data = "${file("${var.ssh_public_key}")}"
        }
    }

    agent_pool_profile {
        name               = "agentpool"
        count              = "${var.agent_count}"
        vm_size            = "Standard_DS1_v2"
        os_type            = "Linux"
        os_disk_size_gb    = 30
        # Required for advanced networking
        vnet_subnet_id = "${azurerm_subnet.k8s-advanced-woi.id}"
    }

    service_principal {
        client_id     = "${var.client_id}"
        client_secret = "${var.client_secret}"
    }
    
    network_profile {
        network_plugin = "azure"
    }

    addon_profile {
        oms_agent {
        enabled                    = true
        log_analytics_workspace_id = "${azurerm_log_analytics_workspace.k8s-advanced-woi.id}"
        }
    }

    tags {
        Environment = "AKS Advanced Demos"
    }
}