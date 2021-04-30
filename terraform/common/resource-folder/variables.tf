variable "vsphere-compute" {
    type        = string
    description = "The compute cluster with which to provision the virtual-machine"
}

variable "vsphere-datacentre" {
    type        = string
    description = "The datacentre in which the compute resources are housed"
}

// variable "vsphere-storage-datastore" {
//     default = ""
//     description = "The storage backend used in lieu of vsphere-storage-cluster"
// }

variable "vsphere-storage-cluster" {
    default     = "HX Datastore Cluster"
    type        = string
    description = "The storage cluster with which to provision the virtual-machine. This can be a storage cluster or regular datastore"
}

variable "folder" {
    default     = "azure-pipeline-testing"
    type        = string
    description = "The name of the folder in which to logically place the vm."
}