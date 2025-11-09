data "tfe_project" "main" {
  name         = "vault-admin"
  organization = var.organization
}

data "tfe_organization" "main" {
  name = var.organization
}

locals {

  vault_configuration_repo = [
    {
      identifier     = "sce81/terraform-tfe-vault-namespaces-root-module"
      oauth_token_id = var.oauth_token_id
      branch = "main"
    }
  ]

  workspace_vars = {
    vault_namespace_vars = {
      "onetech" = {
        "namespace" = {
          value       = "onetech"
          description = "namespace name"
          category    = "terraform"
        },
        "child_namespaces" = {
          value = join(", ", ["production",
          "non-production"])
          description = "namespace name"
          category    = "terraform"
        },
      },
      "vault-configuration" = {
        "namespace" = {
          value       = "vault-configuration"
          description = "namespace name"
          category    = "terraform"
        },
        "child_namespaces" = {
          value = join(", ", ["production",
          "non-production"])
          description = "namespace name"
          category    = "terraform"
        },
      },
      "cloud-security" = {
        "namespace" = {
          value       = "cloud-security"
          description = "namespace name"
          category    = "terraform"
        },
        "child_namespaces" = {
          value = join(", ", ["production",
          "non-production"])
          description = "namespace name"
          category    = "terraform"
        },
      },
    }
  }
}