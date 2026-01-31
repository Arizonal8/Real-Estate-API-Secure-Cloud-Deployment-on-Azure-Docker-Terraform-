#!/bin/bash
# Final deployment cleanup and restart

APP="realestate-api"
RG="realestate-rg"

echo "Deactivating all revisions..."
REVISIONS=$(az containerapp revision list \
  --name $APP \
  --resource-group $RG \
  --query "[].name" -o tsv)

for rev in $REVISIONS; do
  az containerapp revision deactivate \
    --name $APP \
    --resource-group $RG \
    --revision $rev
done

echo "Re-applying secrets..."
./06_secrets-and-env-vars.sh

echo "Restarting container app..."
az containerapp restart \
  --name $APP \
  --resource-group $RG

echo "Final deployment complete."
