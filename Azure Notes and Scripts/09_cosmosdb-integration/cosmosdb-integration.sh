#!/bin/bash
# CosmosDB integration

APP="realestate-api"
RG="realestate-rg"

echo "Setting MongoDB URI secret..."
az containerapp secret set \
  --name $APP \
  --resource-group $RG \
  --secrets mongo-uri="$MONGO_URI"

echo "Mapping MONGO_URI..."
az containerapp update \
  --name $APP \
  --resource-group $RG \
  --set-env-vars MONGO_URI=secretref:mongo-uri

echo "CosmosDB integration complete."
