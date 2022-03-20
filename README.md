# Whoogle Search on Azure Cloud

Repo to quickly host [Whoogle Search](https://github.com/benbusby/whoogle-search)
on [Azure Container Instances](https://docs.microsoft.com/en-us/azure/container-instances/container-instances-overview) or
[Azure Container Apps Preview](https://docs.microsoft.com/en-us/azure/container-apps/overview).

## Azure Container Instances setup

- update `<azure region>` in `Caddyfile`.
- generate `ca.cert` under `certs/ca.cert`.
- update `AZURE_GROUP_NAME` in `run.sh`.
- update `AZURE_GROUP_NAME` and `LOCATION` in `azure-storage-create.sh`.
- update `<azure region>` in `setup.yaml`.
- apply other desired settings in `setup.yaml`

```bash
az login --use-device-code --tenant <yourdiretory.onmicrosoft.com>

# upload Caddyfile to Azure Storage Files
# this script will print `storageAccountName` and `storageAccountKey`
./azure-storage-create.sh

# update `storageAccountName` and `storageAccountKey` in `setup.yaml`

# deploy container instance
./run.sh
```

## Azure Container Apps setup

- update `AZURE_GROUP_NAME` in `azure-container-app-run.sh`.
- update `AZURE_LOCATION` in `azure-container-app-run.sh`.
- update `<azure region>` in `containerapp.yaml`.
- update `kubeEnvironmentId` in `containerapp.yaml`.
- apply other desired settings in `containerapp.yaml`

```bash
az login --use-device-code --tenant <yourdiretory.onmicrosoft.com>
./azure-container-app-run.sh
```
