# Configure the vSphere provider

provider "vsphere" {
  version              = "~> 1.1"
  vsphere_server       = "${var.vsphere_vcenter}"
  user                 = "${var.vsphere_user}"
  password             = "${var.vsphere_password}"
  allow_unverified_ssl = true
}
