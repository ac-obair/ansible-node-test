// understore in output name here is important as it's consumed by ansible.
output "instance_name" {
  value = module.azure-pipeline-provision-iweb-instance.instance-name
  description   = "unique name of a vm created with 'molecule create', used to populate ansible inventory file"
}

output "instance_ip" {
  value = module.azure-pipeline-provision-iweb-instance.instance-ip
  description   = "unique ip of a vm created with 'molecule create', used to populate ansible inventory file"
}