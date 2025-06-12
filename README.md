# minikube
Repo para crear un Cluster k8s usando minikube a partir de scripts en bash.

Testeado con qemu + ubuntu2404 + vagrant

### descripción
El proyecto cuenta con los archivos necesarios para desplegar un cluster Kubernetes via [minikube](https://minikube.sigs.k8s.io/docs/start/) para pruebas de laboratorio, también se instala [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/), [kubecolor](https://github.com/hidetatz/kubecolor) y [helm](https://helm.sh/docs/intro/install/) para la gestión del servicio.

### dependencias
* [Vagrant](https://developer.hashicorp.com/vagrant/install)

### uso
```shell
git clone https://github.com/pgraffigna/bash_minikube.git
cd bash_minikube
vagrant up
```

### extras
* Vagrantfile: Archivo de configuración para desplegar una VM descartable con ubuntu-2404 con libvirt como hipervisor.
* Archivos ".yml" con distintos tipos de configuraciones de ejemplo para referencia.

### scripts:
- docker.sh
- helm.sh
- kubectl.sh
- kubecolor.sh
- minikube.sh

### minikube-cli
```shell
# desplegar cluster con opciones
minikube start --driver=docker --nodes=2 --disk-size=10g --cpus=2 --memory=6g --kubernetes-version=v1.27.12 --cni=calico --profile minik8s

# enumerar nodos
minikube node list --profile minik8s
```

# k3s-cli
```shell
# instalación k3s cluster
## desactivar memoria swap - editar /etc/fstab
comentar la entrada SWAP

# desactivar SWAP
swapoff -a

# descargar e instalar k3s
curl -sfL https://get.k3s.io | sh -s - server --write-kubeconfig-mode 0664

# aplicar configuración
kubectl apply -f whoami.yaml

# consultar deployments, pods, servicios
kubectl get deployment
kubectl get pods -o wide
kubectl get svc

# consultar pvc - persistent volume claim
kubectl get pvc uptime-pvc

# describir objetos
kubectl describe ingress whoami-ingress
kubectl describe pvc uptime-pvc

# desplegar aplicaciones via cli
kubectl run my-ubuntu-pod --image=ubuntu -it
kubectl attach my-ubuntu-pod -c my-ubuntu-pod -it

# port-fordwarding kubernetes/vagrant
kubectl port-forward --address 0.0.0.0 pod/mealie-5479dbb894-tftph 9000:9000

# crear yamls
kubectl create ns testing --dry-run=client -o yaml > namespace.yml

# configurando contexto
kubectl config current-context
kubectl config set-context --current --namespace=testing
```

# k9s-cli
### descargar y descomprimir k9s
```shell
wget -q https://github.com/derailed/k9s/releases/download/v0.40.10/k9s_Linux_amd64.tar.gz
tar xvf k9s_Linux_amd64.tar.gz k9s

# moviendo binario a PATH
sudo mv k9s /usr/local/bin/

# iniciando k9s indicando el path al kubeconfig
k9s --kubeconfig /etc/rancher/k3s/k3s.yaml

# creando variable de entorno
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
```

# metallb - load balancer
### configuracion y despliegue de prueba (pihole)
```shell
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.13.12/config/manifests/metallb-native.yaml

# aplicando configuracion para metalLB
k apply -f metallb-config.yml
k apply -f pihole-ns.yml
k apply -f pihole-pvc.yml
k apply -f pihole-deploy.yml
k apply -f pihole-svc.yml
```