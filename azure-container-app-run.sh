#!/usr/bin/env bash

set -x

AZURE_GROUP_NAME=""
AZURE_LOCATION="<azure region>"
AZURE_CONTAINER_NAME="whoogle"
AZURE_LOG_ANALYTICS_WORKSPACE="$AZURE_CONTAINER_NAME-log-workspace"
AZURE_CONTAINERAPPS_ENV="$AZURE_CONTAINER_NAME-containerapp-env"

az monitor log-analytics workspace create \
    --resource-group "$AZURE_GROUP_NAME" \
    --workspace-name "$AZURE_LOG_ANALYTICS_WORKSPACE"

az monitor log-analytics workspace list --output table

LA_CLIENT_ID=$(az monitor log-analytics workspace show --query customerId --resource-group "$AZURE_GROUP_NAME" --workspace-name "$AZURE_LOG_ANALYTICS_WORKSPACE" --out tsv)
LA_CLIENT_SECRET=$(az monitor log-analytics workspace get-shared-keys --query primarySharedKey --resource-group "$AZURE_GROUP_NAME" --workspace-name "$AZURE_LOG_ANALYTICS_WORKSPACE" --out tsv)

az containerapp env create \
    --resource-group "$AZURE_GROUP_NAME" \
    --name "$AZURE_CONTAINERAPPS_ENV" \
    --logs-workspace-id "$LA_CLIENT_ID" \
    --logs-workspace-key "$LA_CLIENT_SECRET" \
    --location "$AZURE_LOCATION"

az containerapp env list --output table

az containerapp create \
    --resource-group "$AZURE_GROUP_NAME" \
    --name "$AZURE_CONTAINER_NAME" \
    --yaml containerapp.yaml

az containerapp list --resource-group "$AZURE_GROUP_NAME" --output table
az containerapp show --resource-group "$AZURE_GROUP_NAME" \
    --name "$AZURE_CONTAINER_NAME" \
    --query configuration.ingress.fqdn \
    --output table
