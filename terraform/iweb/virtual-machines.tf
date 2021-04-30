resource "random_uuid" "uuid" {
}

module "provision-iweb-for-testing" {
  source                  = "../../modules/vm"
  virtual-machine-name    = "${random_uuid.uuid.result}"
  ip_address              = "10.150.232.111"
  default-gateway         = "10.150.232.254"
  folder                  = "azure-pipeline-testing" // get by data block
  dns-server-list         =  ["10.150.232.10", "10.150.232.15"]

  providers = {
    vsphere               = vsphere.kilbirnie
  }

  vsphere-datacentre      = "PDC"
  vsphere-compute         = "AC-KILB-HX-CLUS1"
}