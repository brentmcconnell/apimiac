# modules/apim/outputs.tf

output "apim_url" {
  description = "The gateway URL for the API Management service."
  value       = azurerm_api_management.apim.gateway_url
}
