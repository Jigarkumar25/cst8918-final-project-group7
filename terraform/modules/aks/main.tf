resource "azurerm_kubernetes_cluster" "test" {
  name                = var.test_cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "cst8918testaks"
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name           = "system"
    node_count     = 1
    vm_size        = var.node_vm_size
    vnet_subnet_id = var.test_subnet_id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "azure"
    dns_service_ip = "10.10.0.10"
    service_cidr   = "10.10.0.0/24"
  }

  sku_tier = "Free"
}

resource "azurerm_kubernetes_cluster" "prod" {
  name                = var.prod_cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "cst8918prodaks"
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name                = "system"
    vm_size             = var.node_vm_size
    vnet_subnet_id      = var.prod_subnet_id
    enable_auto_scaling = true
    min_count           = 1
    max_count           = 3
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "azure"
    dns_service_ip = "10.20.0.10"
    service_cidr   = "10.20.0.0/24"
  }

  sku_tier = "Free"
}