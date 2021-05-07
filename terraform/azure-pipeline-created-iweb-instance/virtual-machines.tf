resource "random_uuid" "uuid" {
}

module "azure-pipeline-provision-iweb-instance" {
  source                  = "git@github.com:ac-obair/vmware-vsphere-clone.git?ref=0.0.1.alpha.1"
  virtual-machine-name    = "${random_uuid.uuid.result}"
  // ip reserved for now, can be extracted for multiple instances with govc
  ip_address              = "10.31.2.10" 
  default-gateway         = "10.31.2.1"
  vlan                    = "DMZ-10.31.2"
  dns-server-list         =  ["10.150.232.10", "10.150.232.15"]

  providers = {
    vsphere               = vsphere.kilbirnie
  }

  vsphere-datacentre      = "PDC"
  vsphere-compute         = "PDC-PL"
}