# aks-baskc
Basic Terraform Provisioning of an AKS Cluster in Azure based on the following recipe:

https://docs.microsoft.com/en-us/azure/terraform/terraform-create-k8s-cluster-with-tf-and-aks

## Usage Instructions

***Pre-Requisites*** - Review **k8s-basic.tf** and **variables.tf**, values used may not either work in your Azure Subscription or follow your conventions, clone this repo and make appropriate changes as needed.

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
echo "$(terraform output kube_config)" > ~/azurek8s-basic
export KUBECONFIG=~/azurek8s-basic

kubectl get nodes
```

