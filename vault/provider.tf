

provider "vault" {
  address = "https://vault.kalamabdul.com:8200"
  token = var.token
  

  # auth_login {
  #   path = "auth/approle/login"

  #   parameters = {
  #     role_id   = var.login_approle_role_id
  #     secret_id = var.login_approle_secret_id
  #   }
  # }
}

variable "token" {
  
}

data "vault_azure_access_credentials" "creds" {
  role                        = "owner"
  validate_creds              = true
  num_sequential_successes    = 3
  num_seconds_between_tests   = 1
  max_cred_validation_seconds = 300 
  backend = "azure"
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
  # client_id = var.client_id
  # client_secret = var.client_secret
  tenant_id = var.tenant_id
  subscription_id = var.subscription_id
  client_id     = data.vault_azure_access_credentials.creds.client_id
  client_secret = data.vault_azure_access_credentials.creds.client_secret
}


