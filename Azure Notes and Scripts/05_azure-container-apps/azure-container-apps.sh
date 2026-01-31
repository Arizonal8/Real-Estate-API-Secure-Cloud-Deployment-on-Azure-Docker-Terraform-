#!/bin/bash
# Azure Container App deployment

APP="realestate-api"
RG="realestate-rg"
IMAGE="arizonal8/realestate-api-lab"

echo "Updating container app image..."
az containerapp update \
  --name $APP \
  --resource-group $RG \
  --image $IMAGE

echo "Listing revisions..."
az containerapp revision list \
  --name $APP \
  --resource-group $RG \
  --output table

echo "Azure Container App update complete."
