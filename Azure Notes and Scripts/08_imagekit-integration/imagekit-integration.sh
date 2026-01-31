#!/bin/bash
# ImageKit integration setup

APP="realestate-api"
RG="realestate-rg"

echo "Setting ImageKit secrets..."
az containerapp secret set \
  --name $APP \
  --resource-group $RG \
  --secrets \
    imagekit-public-key="$IMAGEKIT_PUBLIC_KEY" \
    imagekit-private-key="$IMAGEKIT_PRIVATE_KEY" \
    imagekit-url-endpoint="$IMAGEKIT_URL_ENDPOINT"

echo "Mapping ImageKit env vars..."
az containerapp update \
  --name $APP \
  --resource-group $RG \
  --set-env-vars \
    IMAGEKIT_PUBLIC_KEY=secretref:imagekit-public-key \
    IMAGEKIT_PRIVATE_KEY=secretref:imagekit-private-key \
    IMAGEKIT_URL_ENDPOINT=secretref:imagekit-url-endpoint

echo "ImageKit integration complete."
