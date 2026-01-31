#!/bin/bash
# Set secrets and environment variables

APP="realestate-api"
RG="realestate-rg"

echo "Setting secrets..."
az containerapp secret set \
  --name $APP \
  --resource-group $RG \
  --secrets \
    imagekit-public-key="$IMAGEKIT_PUBLIC_KEY" \
    imagekit-private-key="$IMAGEKIT_PRIVATE_KEY" \
    imagekit-url-endpoint="$IMAGEKIT_URL_ENDPOINT" \
    mongo-uri="$MONGO_URI" \
    smtp-user="$SMTP_USER" \
    smtp-pass="$SMTP_PASS"

echo "Mapping secrets to environment variables..."
az containerapp update \
  --name $APP \
  --resource-group $RG \
  --set-env-vars \
    IMAGEKIT_PUBLIC_KEY=secretref:imagekit-public-key \
    IMAGEKIT_PRIVATE_KEY=secretref:imagekit-private-key \
    IMAGEKIT_URL_ENDPOINT=secretref:imagekit-url-endpoint \
    MONGO_URI=secretref:mongo-uri \
    SMTP_USER=secretref:smtp-user \
    SMTP_PASS=secretref:smtp-pass

echo "Secrets and environment variables updated."
