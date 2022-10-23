#!/bin/bash
# script para instalar helm

###### variables
HELM_URL="https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3"

echo "helm: descargando script para instalar HELM"
curl -fsSL "${HELM_URL}" --output /tmp/get_helm.sh

echo "helm: cambiando permisos al script"
chmod 700 /tmp/get_helm.sh

echo "helm: ejecutando el script"
bash /tmp/get_helm.sh