output "test_cluster_name" {
  value = azurerm_kubernetes_cluster.test.name
}

output "prod_cluster_name" {
  value = azurerm_kubernetes_cluster.prod.name
}

output "test_cluster_id" {
  value = azurerm_kubernetes_cluster.test.id
}

output "prod_cluster_id" {
  value = azurerm_kubernetes_cluster.prod.id
}