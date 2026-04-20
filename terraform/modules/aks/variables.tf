variable "location" {
  description = "Azure region"
  type        = string
  default     = "westus2"
}

variable "resource_group_name" {
  description = "Main project resource group name"
  type        = string
}

variable "test_cluster_name" {
  description = "AKS cluster name for test"
  type        = string
  default     = "cst8918-test-aks"
}

variable "prod_cluster_name" {
  description = "AKS cluster name for prod"
  type        = string
  default     = "cst8918-prod-aks"
}

variable "kubernetes_version" {
  description = "AKS version"
  type        = string
  default     = "1.34.4"
}

variable "node_vm_size" {
  description = "VM size for AKS nodes"
  type        = string
  default     = "Standard_B2s"
}

variable "test_subnet_id" {
  description = "Subnet ID for test AKS"
  type        = string
}

variable "prod_subnet_id" {
  description = "Subnet ID for prod AKS"
  type        = string
}