#!/bin/bash
CRI_TOOL_VERSION="v1.25.0"
CRI_TOOL_URL="https://github.com/kubernetes-sigs/cri-tools/releases/download/${CRI_TOOL_VERSION}/crictl-${CRI_TOOL_VERSION}-linux-amd64.tar.gz"

echo "[CRI-TOOLS] Descargando binario"
wget -q --show-progress --progress=bar:force 2>&1 "${CRI_TOOL_URL}" -O "/tmp/crictl-${CRI_TOOL_VERSION}-linux-amd64.tar.gz"

echo "[CRI-TOOLS] Descomprimiendo + moviendo el binario"
sudo tar xvf /tmp/crictl-${CRI_TOOL_VERSION}-linux-amd64.tar.gz -C /usr/local/bin

