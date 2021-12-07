# Whoogle Search on Azure Cloud

Repo to quickly host [Whoogle Search](https://github.com/benbusby/whoogle-search)
on [Azure Container Instances](https://docs.microsoft.com/en-us/azure/container-instances/container-instances-overview) or
[Azure Container Apps Preview](https://docs.microsoft.com/en-us/azure/container-apps/overview).

## Azure Container Instances setup

- update `AZURE_GROUP_NAME` in `run.sh`.
- update `<azure region>` in `setup.yaml`.
- apply other desired settings in `setup.yaml`

```bash
az login --use-device-code --tenant <yourdiretory.onmicrosoft.com>
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
