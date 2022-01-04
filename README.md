# WordPress Azure Demo

Demo to deploy WordPress to Azure using Azure App Service and Terraform

## Deploy
```bash
# Deploy TF state storage
sh create_tfstate_storage.sh

# Create infra to Azure
terraform init
terraform plan -out=tfplan
terraform apply -auto-approve tfplan
```

## Destroy
```bash
# Destroy modules
terraform destroy -auto-approve 

# Destroy tfstate resource group
az group delete --name wordpress_demo_tfstate_rg
```