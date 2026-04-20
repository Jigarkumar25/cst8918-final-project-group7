variable "location" {
  description = "Azure region"
  type        = string
  default     = "westus2"
}

variable "resource_group_name" {
  description = "Main project resource group name"
  type        = string
  default     = "cst8918-final-project-group-7"
}

variable "vnet_name" {
  description = "Virtual network name"
  type        = string
  default     = "cst8918-final-project-vnet"
}