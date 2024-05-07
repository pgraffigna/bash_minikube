#!/bin/bash
HELM_URL="https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3"

echo "[HELM] Descargando script para instalar HELM"
curl -fsSL "${HELM_URL}" -o /tmp/get_helm.sh

echo "[HELM] Modificando permisos"
chmod 700 /tmp/get_helm.sh

echo "[HELM] Instalando helm"
bash /tmp/get_helm.sh