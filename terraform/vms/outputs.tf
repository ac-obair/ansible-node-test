output "instance-name" {
  value = module.azure-pipeline-provision-iweb-instance.instance-name
  description   = "unique name of a vm created with molecule create, used to populate ansible inventory file"
}

output "instance-ip" {
  value = module.azure-pipeline-provision-iweb-instance.instance-ip
  description   = "unique ip of a vm created with molecule create, used to populate ansible inventory file"
}