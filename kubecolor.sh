#!/bin/bash
# script para instalar kubecolor

######## variables
KUBECOLOR_VERSION="0.0.20-2"
KUBECOLOR_URL="http://archive.ubuntu.com/ubuntu/pool/universe/k/kubecolor/kubecolor_${KUBECOLOR_VERSION}_amd64.deb"
KUBECOLOR_DEB="kubecolor_${KUBECOLOR_VERSION}_amd64.deb"
HOME=/home/vagrant

echo "kubecolor: descargando deb"
curl -s -L "${KUBECOLOR_URL}" --output "/tmp/${KUBECOLOR_DEB}"

echo "kubecolor: instalando deb"
sudo dpkg -i "/tmp/${KUBECOLOR_DEB}"

echo "kubecolor: editando .bashrc"
echo -e "alias kubectl='kubecolor'" >> $HOME/.bashrc

