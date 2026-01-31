#!/bin/bash
# Deactivate all revisions

APP="realestate-api"
RG="realestate-rg"

echo "Fetching revision list..."
REVISIONS=$(az containerapp revision list \
  --name $APP \
  --resource-group $RG \
  --query "[].name" -o tsv)

echo "Deactivating revisions..."
for rev in $REVISIONS; do
  echo "Deactivating $rev..."
  az containerapp revision deactivate \
    --name $APP \
    --resource-group $RG \
    --revision $rev
done

echo "All revisions deactivated."
