# Generic Input Variables
# Business Division
variable "business_division" {
  description = "Business Division in the large organization this Infrastructure belongs"
  type        = string
  default     = "Prakash"
}

# Environment Variable
variable "environment" {
  description = "Environment Variable used as a prefix"
  type        = string
  default     = "Devops"
}

# Azure Resource Group Name 
variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
  default     = "RG-LB"
}

# Azure Resources Location
variable "resource_group_location" {
  description = "Region in which Azure Resources to be created"
  type        = string
  default     = "eastus2"
}
