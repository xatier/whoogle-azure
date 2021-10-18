# Whoogle Search on Azure Container Instances

Repo to quickly host **Whoogle Search** on Azure.

## setup

- update `AZURE_GROUP_NAME` in `run.sh`.
- update `<azure region>` in `setup.yaml`.
- apply other desired settings in `setup.yaml`

```bash
az login --use-device-code
./run.sh
```
