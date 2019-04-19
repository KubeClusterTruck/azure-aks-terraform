# aks-advanced-woi
Advanced Networking Terraform Provisioning of an AKS Cluster in Azure without Ingress.  As there are multiple options for AKS/Kubernetes Ingress, provisioning of Ingress will be handled in one or more ancillary Terraform plans.  

Review doco on deploying AKS with Advanced Networking to get a high-level understanding of the required steps: http://aka.ms/aks-with-vnet.  The core Azure resources provisioned by this plan include:

1. **Resource Group** - Encapsulated all Azure resources for the target Deployment, with exception of the AKS Managed Resources
2. **Vnet + Subnet** - Top level Vnet and AKS Cluster Subnet that the AKS Cluster will be deployed into
3. **Log Analytics Workspace + Solution** - Enable Azure Monitoring of the AKS Cluster and individual Container Applications
4. **AKS Cluster + Advanced Networking** - Baseline install of an AKS Cluster with Vnet Integration, RBAC enabled, with specific SSH Key

As additional configurations that can be layered onto AKS are defined/automated they will be referenced here such as AAD/Cluster Role integration, Ingress Options, Storage Class/Persistence and other Advanced or Cluster Hardening best practices.

## Usage Instructions

***Pre-Requisites*** - Review **k8s-advanced-woi.tf** and **variables.tf**, values used may not either work or follow your conventions, clone this repo and make appropriate changes as needed.

1.  Review basic Azure Terraform setup instructions found [here](../tf-init/README.md).  Initialize your Terraform environment and back-end by executing the following script from this sub-directory:
```
source ../tf-init/terraform_init.sh <location> <keyvault> <service principal client-id> <storage account>
```
2.  Execute your Terraform Plan & Apply to create the AKS Cluster with Advanced Networking the Log Analytics/Container Insights Add-On:
```
terraform plan -out out.plan

terraform apply out.plan
```
3. Perform basic validation of your AKS Cluster using Output from Terraform apply:
```
echo "$(terraform output kube_config)" > ~/azurek8s-advanced-woi
export KUBECONFIG=~/azurek8s-advanced-woi

kubectl get nodes
```


