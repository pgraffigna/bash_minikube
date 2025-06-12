ENV['VAGRANT_DEFAULT_PROVIDER'] = 'libvirt'
IMAGEN = "boxen/ubuntu-24.04"
HOSTNAME = "minikube.home.local"

Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.define "minikube" do |m|
    m.vm.box = IMAGEN
    m.vm.hostname = HOSTNAME
    m.vm.provision "shell", path: "docker.sh"
    m.vm.provision "shell", path: "helm.sh"
    m.vm.provision "shell", path: "kubectl.sh"
    m.vm.provision "shell", path: "kubecolor.sh"
    m.vm.provision "shell", path: "minikube.sh"
  end

  config.vm.provider :libvirt do |k|
    k.disk_bus = 'virtio'
    k.memory = "4096"
    k.cpus = "2"
    k.graphics_type = 'none'
  end
end

