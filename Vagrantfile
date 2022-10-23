ENV['VAGRANT_DEFAULT_PROVIDER'] = 'libvirt'
IMAGEN = "generic/ubuntu2004"

Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.define "minikube" do |m|
    m.vm.box = IMAGEN
    m.vm.hostname = "minikube-test"
    m.vm.provision "shell", path: "docker.sh"
    m.vm.provision "shell", path: "helm.sh"
    m.vm.provision "shell", path: "kubectl.sh"
    m.vm.provision "shell", path: "kubecolor.sh"
    m.vm.provision "shell", path: "minikube.sh"
  end

  config.vm.provider :libvirt do |l|
    l.memory = "4096"
    l.cpus = "2"
  end
end

# Para copiar archivos entre equipos
# scp -i /home/pgraffigna/.vagrant.d/insecure_private_key minikube.sh vagrant@192.168.122.91:
