variable "location" {
  description = "Azure region for backend resources"
  type        = string
  default     = "westus2"
}

variable "resource_group_name" {
  description = "Backend resource group name"
  type        = string
  default     = "cst8918-final-project-backend-rg"
}

variable "storage_account_name" {
  description = "Globally unique storage account name"
  type        = string
}

variable "container_name" {
  description = "Blob container for Terraform state"
  type        = string
  default     = "tfstate"
}