#
# Run these commands with correct ACR path if you want to use Dockerfile with custom configuration
#

# Build WordPress image with uploads.ini configuration
docker build -f Dockerfile -t wordpress_azure_demo/wordpress .

# Tag image to correct ACR
docker tag wordpress_azure_demo/wordpress YOUR_ACR_PATH/wordpress

# Login to ACR
az acr login --name YOUR_ACR_PATH

# Push image to ACRE
docker push YOUR_ACR_PATH/wordpress