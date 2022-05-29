#!/bin/bash
URL="https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3"

curl -fsSL -o get_helm.sh "$URL"
chmod 700 get_helm.sh
bash ./get_helm.sh