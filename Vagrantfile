# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

# This stuff is cargo-culted from http://www.stefanwrobel.com/how-to-make-vagrant-performance-not-suck
# # Give access to half of all cpu cores on the host. We divide by 2 as we assume that users are running with hyperthreads.
 host = RbConfig::CONFIG['host_os']
 if host =~ /darwin/
   $vm_cpus = (`sysctl -n hw.ncpu`.to_i/2.0).ceil
 elsif host =~ /linux/
   $vm_cpus = (`nproc`.to_i/2.0).ceil
 else # sorry Windows folks, I can't help you
   $vm_cpus = 2
 end
 $vm_mem=4000.to_i

Vagrant.configure(2) do |config|

   config.vm.provider  :virtualbox do |v|
       v.customize ["modifyvm",:id,"--memory",$vm_mem]
       v.customize ["modifyvm",:id,"--cpus",$vm_cpus]
       #config.vm.synced_folder ".", "/home/vagrant/sync"

    #Use faster paravirtualized networking
       v.customize ["modifyvm",:id,"--nictype1","virtio"]
       v.customize ["modifyvm",:id,"--nictype2","virtio"]
   end
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/vivid64"
  config.vm.provision "shell", path: "bin/gce.sh"

end
