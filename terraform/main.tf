module "network" {
  source = "./modules/network"
}

module "aks" {
  source              = "./modules/aks"
  resource_group_name = module.network.resource_group_name
  test_subnet_id      = module.network.test_subnet_id
  prod_subnet_id      = module.network.prod_subnet_id
}