#!/bin/sh
#
# Initialize Terraform & Connect Supporting Storage Account
# Uses the following Command-Line Parameters:
# $1  - Azure Location (e.g. centralus)
# $2  - Azure Key Vault (must be in Azure Location, be accessible from Current Subscription/Tenant)
# $3  - Azure AD App Id/Service Principal (must be Contributor in Target Azure Resource Groups)
# $4  - Azure Storage Account for Terraform State (assumes Container named "tfstate" created)
#
# Set Required Environment Variables (will use current/defaul Azure Subscription/Tenant)
#
echo "--- Setting environment variables for Terraform"
export ARM_LOCATION=$1
export ARM_KEY_VAULT=$2
export ARM_CLIENT_ID=$3
export ARM_CLIENT_SECRET=$(az keyvault secret show --name "$ARM_CLIENT_ID" --vault-name "$ARM_KEY_VAULT" --query "value" --output tsv)
export ARM_SUBSCRIPTION_ID=$(az account show --query "{subscriptionId:id}" --output tsv)
export ARM_TENANT_ID=$(az account show --query "{tenantId:tenantId}" --output tsv)
export TF_VAR_storage_acct=$4
export TF_VAR_blob_container=tfstate
export ARM_ACCESS_KEY=$(az keyvault secret show --name "$TF_VAR_storage_acct" --vault-name "$ARM_KEY_VAULT" --query "value" --output tsv)
export TF_VAR_client_id=$ARM_CLIENT_ID
export TF_VAR_client_secret=$ARM_CLIENT_SECRET
#
env | grep ARM
echo "---"
env | grep TF_VAR_
#
echo "--- Initializing Terraform"
terraform init --backend-config "storage_account_name=$TF_VAR_storage_acct" --backend-config "container_name=$TF_VAR_blob_container"
