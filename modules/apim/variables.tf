# APIM module variables

variable "apim_name" {
  type        = string
  description = "The name of the API Management service."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
}

variable "location" {
  type        = string
  description = "The Azure region to deploy the resource."
}

variable "publisher_name" {
  type        = string
  description = "The name of the API publisher."
}

variable "publisher_email" {
  type        = string
  description = "The email of the API publisher."
}

variable "sku_name" {
  type        = string
  description = "The SKU of the API Management service."
  default     = "Developer_1"
}

variable "api_name" {
  type        = string
  description = "The name of the API."
}

variable "api_display_name" {
  type        = string
  description = "The display name of the API."
}

variable "api_path" {
  type        = string
  description = "The path of the API."
}

