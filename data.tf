data "tfe_project" "main" {
  name         = "vault-configuration"
  organization = var.organization
}

data "tfe_organization" "main" {
  name = var.organization
}

data "tfe_github_app_installation" "github" {
  installation_id = var.github_installation_id
}
locals {

  vault_configuration_repo = [
    {
      identifier                 = "sce81/terraform-tfe-vault-namespaces-root-module"
      github_app_installation_id = data.tfe_github_app_installation.github.id
      branch                     = "main"
    }
  ]

  workspace_vars = {
    vault_namespace_vars = {
      "test1" = {
        "namespace" = {
          value       = "namespace1"
          description = "namespace name"
          category    = "terraform"
        },
        "child_namespaces" = {
          value       = join(", ", ["dev", "staging", "production"])
          description = "namespace name"
          category    = "terraform"
        },
      },
      "test2" = {
        "namespace" = {
          value       = "namespace2"
          description = "namespace name"
          category    = "terraform"
        },
        "child_namespaces" = {
          value       = join(", ", ["dev", "staging", "testing", "production"])
          description = "namespace name"
          category    = "terraform"
        },
      },
    },
  }
}