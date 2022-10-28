#!/usr/bin/env bash
# script para instalar cri-dockerd

###### variables
CRI_DOCKERD_VERSION="v0.2.0"
CRI_DOCKERD_URL="https://github.com/Mirantis/cri-dockerd/releases/download/${CRI_DOCKERD_VERSION}/cri-dockerd-${CRI_DOCKERD_VERSION}-linux-amd64.tar.gz"
CRI_DOCKERD_SERVICE="https://raw.githubusercontent.com/Mirantis/cri-dockerd/master/packaging/systemd/cri-docker.service"
CRI_DOCKERD_SOCKET="https://raw.githubusercontent.com/Mirantis/cri-dockerd/master/packaging/systemd/cri-docker.socket"

echo "cridockerd: descargando binario"
wget -q --show-progress --progress=bar:force 2>&1 "${CRI_DOCKERD_URL}" -O "/tmp/cri-dockerd-${CRI_DOCKERD_VERSION}-linux-amd64.tar.gz"

echo "cridockerd: descomprimiendo tar.gz"
sudo tar xvf /tmp/cri-dockerd-"${CRI_DOCKERD_VERSION}"-linux-amd64.tar.gz -C /usr/local/bin

echo "cridockerd: descargando systemd service"
wget -q --show-progress --progress=bar:force 2>&1 "${CRI_DOCKERD_SERVICE}" -O "/tmp/cri-docker.service"

echo "cridockerd: descargando systemd socket"
wget -q --show-progress --progress=bar:force 2>&1 "${CRI_DOCKERD_SOCKET}" -O "/tmp/cri-docker.socket"

echo "cridockerd: moviendo systemd socket + service"
sudo mv /tmp/cri-docker.socket /tmp/cri-docker.service /etc/systemd/system/

echo "cridockerd: configurando el servicio"
sudo sed -i -e 's,/usr/bin/cri-dockerd,/usr/local/bin/cri-dockerd,' /etc/systemd/system/cri-docker.service

echo "cridockerd: reiniciar y activando el servicio"
sudo systemctl daemon-reload && sudo systemctl enable cri-docker.service --now
