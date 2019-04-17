# aks-advanced-woi
Advanced Networking Terraform Provisioning of an AKS Cluster in Azure without Ingress.  As there are multiple options for AKS/Kubernetes Ingress, provisioning of Ingress will be handled in one or more ancillary Terraform plans.  

Review doco on deploying AKS with Advanced Networking to get a high-level understanding of the required steps: http://aka.ms/aks-with-vnet.  The core Azure resources provisioned by this plan include:

1. **Resource Group** - Encapsulated all Azure resources for the target Deployment, with exception of the AKS Managed Resources
2. **Vnet + Subnet** - Top level Vnet and AKS Cluster Subnet that the AKS Cluster will be deployed into
3. **Log Analytics Workspace + Solution** - Enable Azure Monitoring of the AKS Cluster and individual Container Applications
4. **AKS Cluster + Advanced Networking** - Baseline install of an AKS Cluster with Vnet Integration, RBAC enabled, with specific SSH Key

As additional configurations that can be layered onto AKS are defined/automated they will be referenced here such as AAD/Cluster Role integration, Ingress Options, Storage Class/Persistence and other Advanced or Cluster Hardening best practices.


