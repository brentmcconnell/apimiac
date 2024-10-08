# Terraform Azure API Management Deployment

This repository contains Terraform code to deploy an Azure API Management (APIM) service for the Star Wars API. The code is structured to use Terraform modules for better organization and reusability.

## Explanation of the Code
This Terraform configuration sets up an Azure API Management service for the Star Wars API. It uses a module to encapsulate the resources related to the API Management service, making the code more organized and reusable. Follow the steps in the "How to Deploy" section to deploy the resources to your Azure subscription.

### Structure
The repository is organized as follows:  
├── main.tf  
├── modules/  
│ └── apim/  
│ ├─── main.tf  
│ ├─── outputs.tf   
│ └─── variables.tf   

### Main Components

- **main.tf**: This is the main entry point for the Terraform configuration. It defines the provider, resource group, and includes the APIM module.
- **modules/apim/**: This directory contains the Terraform module for deploying the API Management service and related resources.

### Files in `modules/apim/`

- **main.tf**: Defines the resources for the API Management service, including the API and its operations.
- **variables.tf**: Declares the input variables for the module.
- **outputs.tf**: Defines the outputs of the module, such as the gateway URL of the API Management service.

## Terraform Modules

Terraform modules are a way to encapsulate and reuse code. A module is a container for multiple resources that are used together. Modules can be called multiple times, with different configurations, to create multiple instances of the resources they contain.

In this repository, the `apim` module is used to deploy the API Management service. The module is defined in the `modules/apim/` directory and is called from the `main.tf` file.

## How to Deploy using Terraform
### Prerequisites

- An Azure subscription.
- [Terraform](https://www.terraform.io/downloads.html) installed on your machine.  
  
  You can install Terraform from PowerShell using:
  ```powershell
  winget install hashicorp.terraform
  ```
### Steps

1. **Clone the Repository**: First, clone this repository to your local machine.
    ```sh
    git clone <repository-url>
    cd <repository-directory>
    ```

2. **Configure Azure Credentials**: Ensure that your Azure credentials are configured. You can do this by logging in using the Azure CLI.
    ```sh
    az login
    ```

3. **Terraform Variables** Create a variables.tfvars file in the root of the repository.
   ```hcl
   # variables.tfvars
    subscription_id      = "YOUR-SUBSCRIPTION-ID"
    resource_group_name  = "YOUR-RESOURCE-GROUP-NAME"
    location             = "YOUR-RESOURCE-LOCATION (e.g., East US)"
    apim_name            = "APIM-INSTANCE-NAME"
    publisher_name       = "API-PUBLISHER-NAME (e.g., Star Wars API)"
    publisher_email      = "API-PUBLISHER-EMAIL (e.g., info@swapi.dev)"
    sku_name             = "APIM-SKU (e.g., Consumption_0)"
    api_name             = "API-NAME (e.g., swapi)"
    api_display_name     = "API-DISPLAY-NAME (e.g., Star Wars API)"
    api_path             = "API-PATH (e.g., swapi)"
    ```

4. **Initialize Terraform**: This will download the necessary providers and modules.
    ```sh
    terraform init
    ```

5. **Plan the Deployment**: This will show you what changes will be made by the deployment.
    ```sh
    terraform plan
    ```

6. **Apply the Deployment**: This will apply the changes and deploy the resources to Azure.
    ```sh
    terraform apply
    ```
7. **Retrieve Outputs**: After the deployment is complete, retrieve the output values, such as the gateway URL of the API Management service.
    ```sh
    terraform output apim_url
    ```