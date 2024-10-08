# modules/apim/main.tf

resource "azurerm_api_management" "apim" {
  name                = var.apim_name
  location            = var.location
  resource_group_name = var.resource_group_name
  publisher_name      = var.publisher_name
  publisher_email     = var.publisher_email
  sku_name            = var.sku_name
}

# resource "azurerm_api_management_api" "conference-api" {
#   name                = var.api_name
#   api_management_name = azurerm_api_management.apim.name
#   resource_group_name = var.resource_group_name
#   service_url         = azurerm_api_management_backend.conference-backend.url
#   revision            = "1"
#   display_name        = var.api_display_name
#   path                = var.api_path
#   protocols           = ["https"]
# }

# resource "azurerm_api_management_backend" "conference-backend" {
#   name                = "conference-backend"
#   api_management_name = azurerm_api_management.apim.name
#   resource_group_name = var.resource_group_name
#   url                 = "https://conferenceapi.azurewebsites.net"
#   protocol            = "http"
# }

# resource "azurerm_api_management_api_operation" "get-session" {
#   api_name            = azurerm_api_management_api.conference-api.name
#   operation_id        = "GetSession"
#   display_name        = "GetSession"
#   method              = "GET"
#   url_template        = "/session/{id}"
#   api_management_name = azurerm_api_management.apim.name
#   resource_group_name = var.resource_group_name

#   template_parameter {
#     name     = "id"
#     type     = "number"
#     required = true
#   }

#   response {
#     status_code  = 200
#     description  = "A successful response"
#     representation {
#       content_type = "application/json"
#     }
#   }
# }

# resource "azurerm_api_management_api_operation" "get-sessions" {
#   api_name            = azurerm_api_management_api.conference-api.name
#   operation_id        = "GetSessions"
#   display_name        = "GetSessions"
#   method              = "GET"
#   url_template        = "/sessions"
#   api_management_name = azurerm_api_management.apim.name
#   resource_group_name = var.resource_group_name

#   request {
#     query_parameter {
#       name     = "speakername"
#       required = false 
#       type     = "string"
#     }
#     query_parameter {
#       name     = "dayno"
#       required = false 
#       type     = "integer"
#     }
#     query_parameter {
#       name     = "keyword"
#       required = false 
#       type     = "string"
#     }
#   }

#   response {
#     status_code  = 200
#     description  = "A successful response"
#     representation {
#       content_type = "application/json"
#     }
#   }
# }

# resource "azurerm_api_management_api_operation" "get-session-topics" {
#   api_name            = azurerm_api_management_api.conference-api.name
#   operation_id        = "GetSessionTopics"
#   display_name        = "GetSessionTopics"
#   method              = "GET"
#   url_template        = "/session/{id}/topics"
#   api_management_name = azurerm_api_management.apim.name
#   resource_group_name = var.resource_group_name

#   template_parameter {
#     name     = "id"
#     type     = "number"
#     required = true
#   }

#   response {
#     status_code  = 200
#     description  = "A successful response"
#     representation {
#       content_type = "application/json"
#     }
#   }
# }

# resource "azurerm_api_management_api_schema" "body" {
#   schema_id           = "Body"
#   api_name            = azurerm_api_management_api.conference-api.name
#   api_management_name = azurerm_api_management.apim.name
#   resource_group_name = var.resource_group_name
#   content_type        = "application/json"
#   value               = <<JSON
# {
#   "type": "string",
# }
#   JSON
# }

# resource "azurerm_api_management_api_operation" "submit-session" {
#   api_name            = azurerm_api_management_api.conference-api.name
#   operation_id        = "SubmitSession"
#   display_name        = "SubmitSession"
#   method              = "POST"
#   url_template        = "/session/{id}/feedback"
#   api_management_name = azurerm_api_management.apim.name
#   resource_group_name = var.resource_group_name

#   template_parameter {
#     name     = "id"
#     type     = "number"
#     required = true
#   }

#   request {
#     representation {
#       content_type = "text/plain"
#       schema_id = azurerm_api_management_api_schema.body.schema_id 
#     }
#   }

#   response {
#     status_code  = 200
#     description  = "A successful response"
#     representation {
#       content_type = "application/json"
#       schema_id = azurerm_api_management_api_schema.body.schema_id 
#     }
#   }
# }

# # # Apply a policy to rate limit and set quota by key against an operation
# resource "azurerm_api_management_api_operation_policy" "rate-policy" {
#   api_name            = azurerm_api_management_api.conference-api.name
#   api_management_name = azurerm_api_management.apim.name
#   operation_id        = azurerm_api_management_api_operation.get-sessions.operation_id
#   resource_group_name = var.resource_group_name
#   xml_content         = file("${path.module}/get-sessions-policy.xml")
# }

# # # Apply a policy to set quota for all operations
# resource "azurerm_api_management_api_policy" "quota-policy" {
#   api_name            = azurerm_api_management_api.conference-api.name
#   api_management_name = azurerm_api_management.apim.name
#   resource_group_name = var.resource_group_name
#   xml_content         = file("${path.module}/all-operations-policy.xml")
# }

# resource "azurerm_api_management_api" "conference" {
#   name                = "conference"
#   resource_group_name = var.resource_group_name 
#   api_management_name = azurerm_api_management.apim.name
#   revision            = "1"
#   display_name        = "Conference API"
#   path                = "conference"
#   protocols           = ["https"]
#   service_url         = azurerm_api_management_backend.conference-backend.url

#   import {
#     content_format = "swagger-link-json"
#     content_value  = "https://conferenceapi.azurewebsites.net/?format=json" 
#   }
# }

# resource "azurerm_api_management_backend" "conference-backend" {
#   name                = "conference-backend"
#   api_management_name = azurerm_api_management.apim.name
#   resource_group_name = var.resource_group_name
#   url                 = "https://conferenceapi.azurewebsites.net"
#   protocol            = "http"
# }