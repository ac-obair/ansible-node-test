variable "virtual-machine-name" {
    type        = string
    description = "The host portion of the fqdn of the virtual-machine"
}

variable "domain" {
    type        = string
    default     = "arnoldclark.com"
    description = "The default domain to use for the fqdn of the virtual-machine."
}

variable "vsphere-compute" {
    type        = string
    description = "The compute cluster with which to provision the virtual-machine"
}

variable "vsphere-datacentre" {
    type        = string
    description = "The datacentre in which the compute resources are housed"
}

variable "vsphere-storage-datastore" {
    default = ""
}

variable "vsphere-storage-cluster" {
    default     = "HX Datastore Cluster"
    type        = string
    description = "The storage cluster with which to provision the virtual-machine. This can be a storage cluster or regular datastore"
}

variable "ip_address" {
    type        = string
    description = "The IP address of the vm's ens160 interface."
}

variable "vlan" {
    default     = "ACVLAN160"
    type        = string
    description = "The IP address of the vm's ens160 interface."
}

variable "default-gateway" {
    type        = string
    description = "The default gateway of the vm."
}

variable "folder" {
    type        = string
    description = "The name of the folder in which to logically place the vm."
}

variable "dns-server-list" {
    type        = list
    default     = ["10.150.232.10","10.150.232.15"]
    description = "A list of valid dns resolvers."
}
