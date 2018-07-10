# Variables

// VMware vSphere IP address
variable "vsphere_vcenter" {
  type = "string"
}

// VMware vCenter username
variable "vsphere_user" {
  type = "string"
}

// VMware vCenter password
variable "vsphere_password" {
  type = "string"
}

// vSphere datacenter name
variable "vsphere_datacenter" {
  type = "string"
}

// Cluster where workload will be provisioned to
variable "vsphere_cluster" {
  type = "string"
}

// Root password for the VM instances spun up
variable "root_password" {
  type = "string"
}

// Name of the virtual port group for the deployment
variable "network_name" {
  type = "string"
}

// Name of the vSphere Template that we'll use for the deployment
variable "template_name" {
  type = "string"
}

// Name of the Datastore to place the clone VM on
variable "datastore_name" {
  type = "string"
}

// Virtual Machine name prefix
variable "virtual_machine_name_prefix" {
  type = "string"
}

// The domain name to set up each virtual machine as.
variable "virtual_machine_domain" {
  type = "string"
}

// The network address for the virtual machines, in the form of 10.0.0.0/24.
variable "virtual_machine_network_address" {
  type = "string"
}

// The last octect that serves as the start of the IP addresses for the virtual
// machines. Given the default value here of 100, if the network address is
// 10.0.0.0/24, the 3 virtual machines will be assigned addresses 10.0.0.100,
// 10.0.0.101, and 10.0.0.102.
variable "virtual_machine_ip_address_start" {
  default = "20"
}

// The default gateway for the network the virtual machines reside in.
variable "virtual_machine_gateway" {
  type = "string"
}

// The DNS servers for the network the virtual machines reside in.
variable "virtual_machine_dns_servers" {
  type = "list"
}

variable "number_instances" {
  type = "string"
}