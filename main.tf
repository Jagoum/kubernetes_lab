terraform {
  required_providers {
    multipass = {
      source  = "larstobi/multipass"
      version = "1.4.2"
    }
  }
}

resource "multipass_instance" "controller" {
  name = "controller-node"
  cpus = 2
  memory = "2G"
  disk = "10G"
}

resource "multipass_instance" "worker" {
  count = 3
  name = "worker-${count.index}"
  cpus = 1
  memory = "2G"
  disk = "10G"
}

output "controller_ip" {
  value = multipass_instance.controller
}

output "worker_ips" {
  value = [for instance in multipass_instance.worker : instance]
}

