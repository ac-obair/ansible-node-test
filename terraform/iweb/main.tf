provider "vsphere" {
  alias          = "kilbirnie"
  user           = var.vsphere-user
  password       = var.vsphere-user-password
  vsphere_server = "s000126pl.aco.arnoldclark.com"

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

// provider "vsphere" {
//   alias          = "southstreet"
//   user           = var.vsphere-user
//   password       = var.vsphere-user-password
//   vsphere_server = "s000137pl.aco.arnoldclark.com"

//   # If you have a self-signed cert
//   allow_unverified_ssl = true
// }

terraform {
  backend "azurerm" {
    storage_account_name = "actfstate"
    container_name       = "ac-iac-platform-on-premises"
    key                  = "dev/iweb"
  }
}