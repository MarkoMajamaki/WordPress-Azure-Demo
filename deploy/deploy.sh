echo "Deploy to Azure"

# Deploy TF state storage
sh infra/create_tfstate_storage.sh

# Create infra to Azure
terraform -chdir=infra init
terraform -chdir=infra plan
terraform -chdir=infra apply -auto-approve



# terraform -chdir=infra destroy -auto-approve 
