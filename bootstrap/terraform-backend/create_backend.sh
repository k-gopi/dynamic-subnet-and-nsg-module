#!/bin/bash

RESOURCE_GROUP="fis-uat-tfstate-rg"
LOCATION="centralindia"
STORAGE_ACCOUNT="fisuattfstate"
CONTAINER_NAME="tfstate"

echo "Checking Resource Group..."

RG_EXISTS=$(az group exists --name $RESOURCE_GROUP)

if [ "$RG_EXISTS" = false ]; then
  echo "Creating Resource Group..."
  az group create \
    --name $RESOURCE_GROUP \
    --location $LOCATION \
    --tags project="fis" environment="uat" purpose="tfstate"
else
  echo "Resource Group already exists. Skipping..."
fi


echo "Checking Storage Account..."

STORAGE_EXISTS=$(az storage account check-name --name $STORAGE_ACCOUNT --query "nameAvailable" -o tsv)

if [ "$STORAGE_EXISTS" = true ]; then
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
else
  echo "Storage Account already exists. Skipping..."
fi


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


echo "Checking Blob Container..."

CONTAINER_EXISTS=$(az storage container exists \
  --name $CONTAINER_NAME \
  --account-name $STORAGE_ACCOUNT \
  --auth-mode login \
  --query "exists" \
  -o tsv)

if [ "$CONTAINER_EXISTS" = false ]; then
  echo "Creating Blob Container..."
  az storage container create \
    --name $CONTAINER_NAME \
    --account-name $STORAGE_ACCOUNT \
    --auth-mode login \
    --public-access off
else
  echo "Container already exists. Skipping..."
fi


echo "Terraform backend setup complete!"
echo "Resource Group: $RESOURCE_GROUP"
echo "Storage Account: $STORAGE_ACCOUNT"
echo "Container Name: $CONTAINER_NAME"