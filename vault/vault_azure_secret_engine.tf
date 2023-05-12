resource "vault_azure_secret_backend" "azure" {
  use_microsoft_graph_api = true
  subscription_id         = var.subscription_id
  tenant_id               = var.tenant_id
  client_id               = var.client_id
  client_secret           = var.client_secret
  environment             = "AzurePublicCloud"
}

resource "vault_azure_secret_backend_role" "generated_role" {
  backend                     = vault_azure_secret_backend.azure.path
  role                        = "owner"
  max_ttl                         = 172800
  ttl                     = 86400

  azure_roles {
     role_name = "Owner"
    scope =  "/subscriptions/a60b33e7-926f-4483-9487-5d4a21f8c94e/resourceGroups/testka"
  }
  # azure_roles {
  # role_name = "reader"
  #   scope =  "/subscriptions/a60b33e7-926f-4483-9487-5d4a21f8c94e"
  # }
}



