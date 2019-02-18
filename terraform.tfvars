vsphere_vcenter = "192.168.10.7"

vsphere_user = "administrator@vsphere.local"

vsphere_datacenter = "lab"

vsphere_cluster = "prod"

network_name = "production"

template_name = "UBUNTU-1604-PROD"

datastore_name = "PROD-VSAN"

virtual_machine_name_prefix = "kube"

virtual_machine_domain = "lab.timcarr.net"

virtual_machine_network_address = "192.168.10.0/24"

virtual_machine_gateway = "192.168.10.1"

virtual_machine_dns_servers = [
  "192.168.10.50",
  "192.168.10.51",
]

number_instances = 8
