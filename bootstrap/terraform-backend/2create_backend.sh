#!/bin/bash
set -e

RESOURCE_GROUP="fis-uat-tfstate-rg"
LOCATION="centralindia"
STORAGE_ACCOUNT="fisuattfstate"
CONTAINER_NAME="tfstate"

echo "Creating Resource Group..."
az group create \
  --name $RESOURCE_GROUP \
  --location $LOCATION \
  --tags project="fis" environment="uat" purpose="tfstate"

echo "Creating Storage Account..."
az storage account create \
  --name $STORAGE_ACCOUNT \
  --resource-group $RESOURCE_GROUP \
  --sku Standard_LRS \
  --kind StorageV2 \
  --location $LOCATION \
  --https-only true \
  --min-tls-version TLS1_2 \
  --tags project="fis" environment="uat" purpose="tfstate"

echo "Enabling Blob Versioning..."
az storage account blob-service-properties update \
  --account-name $STORAGE_ACCOUNT \
  --resource-group $RESOURCE_GROUP \
  --enable-versioning true

echo "Enabling Blob & Container Soft Delete..."
az storage account blob-service-properties update \
  --account-name $STORAGE_ACCOUNT \
  --resource-group $RESOURCE_GROUP \
  --enable-delete-retention true \
  --delete-retention-days 7 \
  --enable-container-delete-retention true \
  --container-delete-retention-days 7

echo "Creating Blob Container for Terraform backend..."
az storage container create \
  --name $CONTAINER_NAME \
  --account-name $STORAGE_ACCOUNT \
  --public-access off

echo "Terraform backend setup complete!"
echo "Resource Group: $RESOURCE_GROUP"
echo "Storage Account: $STORAGE_ACCOUNT"
echo "Container Name: $CONTAINER_NAME"