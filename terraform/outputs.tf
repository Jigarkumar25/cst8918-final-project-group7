output "resource_group_name" {
  value = module.network.resource_group_name
}

output "vnet_name" {
  value = module.network.vnet_name
}

output "prod_subnet_id" {
  value = module.network.prod_subnet_id
}

output "test_subnet_id" {
  value = module.network.test_subnet_id
}

output "dev_subnet_id" {
  value = module.network.dev_subnet_id
}

output "admin_subnet_id" {
  value = module.network.admin_subnet_id
}
output "test_cluster_name" {
  value = module.aks.test_cluster_name
}

output "prod_cluster_name" {
  value = module.aks.prod_cluster_name
}