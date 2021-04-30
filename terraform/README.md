example of new vm at kilbirnie
```terraform
module "vm02" {
  source                  = "../../modules/vm"
  virtual-machine-name    = "vm02"
  ip_address              = "n.n.n.n"
  default-gateway         = "n.n.n.n"
  folder                  = "my-vm-folder"
  dns-server-list         =  ["n.n.n.n", "n.n.n.n"]

  providers = {
    vsphere = vsphere.kilbirnie
  }

  vsphere-datacentre      = "PDC"
  vsphere-compute         = "AC-SS-HX-CLUS1"
}
```

example of new vm at south street
```terraform
module "vm02" {
  source                  = "../../modules/vm"
  virtual-machine-name    = "vm02"
  ip_address              = "n.n.n.n"
  default-gateway         = "n.n.n.n"
  folder                  = "my-vm-folder"
  dns-server-list         =  ["n.n.n.n", "n.n.n.n"]

  providers = {
    vsphere = vsphere.southstreet
  }

  vsphere-datacentre      = "SDC"
  vsphere-compute         = "AC-SS-HX-CLUS3"
}
```