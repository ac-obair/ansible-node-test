data "vsphere_folder" "folder" {
  path          = "azure-pipeline-testing"
  type          = "vm"
  datacenter_id = data.vsphere_datacenter.datacentre.id
}