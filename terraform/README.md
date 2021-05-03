parallel infrastructure terraform
#### authenticating
A common automation user should be used and credentials protected in the pipeline as secrets. However for testing credentials can be injected into the environment. Note special characters in passwords will have to be escaped. When creating the environ vars you don't need to specify `user` or `pass` in the hcl. 
```bash
export VSPHERE_PASSWORD=<pass>
export VSPHERE_USER=<user>
```
#### datastore clusters
The "dev" hosts don't have data store clusters implenented this means the exact same terraform can't be used acorss all scenarios. In prd the datastore clusters don't have the same name, this also means the exact same terraform can't be used across datacentres without some conditional branching. 

"dev" is using a different module to place resources `vsphere_datastore` whereas on prd hosts `vsphere_datastore_cluster` can be used.

#### abstrations
abstract the datacentres with an alias, used in modules.
```terraform
provider "vsphere" {
  alias          = "kilbirnie"
  user           = var.vsphere-user
  password       = var.vsphere-user-password
  vsphere_server = "s000126pl.aco.arnoldclark.com"
  // If you have a self-signed cert
  allow_unverified_ssl = true
}
```
With the following and with the proper abstractions, the only difference in metadata between the two datacentres need be the provider and `vsphere-datacentre` and `vsphere-compute`. 
```terraform
provider "vsphere" {
 alias          = "southstreet"
 user           = var.vsphere-user
 password       = var.vsphere-user-password
 vsphere_server = "s000137pl.aco.arnoldclark.com"
  // If you have a self-signed cert
  allow_unverified_ssl = true
}
```
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