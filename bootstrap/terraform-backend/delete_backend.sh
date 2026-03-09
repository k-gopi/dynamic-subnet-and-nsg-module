#!/bin/bash
set -e

# Variables
RESOURCE_GROUP="fis-uat-tfstate-rg"

echo "Deleting Terraform backend resource group..."

az group delete \
  --name $RESOURCE_GROUP \
  --yes \
  --no-wait

echo "Terraform backend resource group deletion initiated"