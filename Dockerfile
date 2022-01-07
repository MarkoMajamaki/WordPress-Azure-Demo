#
# Use this to create image to ACR with uploads configuration. Run build_and_push_to_acr.sh script
# to upload image to ACR and change image name in terraform.tfvars file.
#

FROM wordpress:5.8.2

# PHP Configuration
COPY ./uploads.ini /usr/local/etc/php/conf.d/uploads.ini