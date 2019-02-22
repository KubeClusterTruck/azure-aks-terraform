Will provide more specific solution doco, but based on the following recipe:

https://docs.microsoft.com/en-us/azure/terraform/terraform-create-k8s-cluster-with-tf-and-aks

Additionally, provided an Azure/Terraform initialization script that can be used to initialize the Terraform backend & azure connections in:

https://github.com/KubeClusterTruck/azure-aks-terraform/blob/master/tf-init/terraform_init.sh

source this script into your current shell( e.g from bash:  source ./terraform_init.sh) after reviewing script doco.  Requires and Service Principal, Storage Account, and Keyvault to be created with entries for the Service Principal and Storage Account secrets with values being the Service Principal and Storage Acct names.
