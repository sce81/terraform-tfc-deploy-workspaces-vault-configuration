terraform {
  cloud {
    organization = "HashiCorp_AWS_Org"

    workspaces {
      name    = "deploy-workspaces-vault-namespaces"
      project = "workspace-management-vault"
    }
  }
  required_providers {
    tfe = {
      version = "~> 0.70.0"
      source  = "hashicorp/tfe"
    }
  }
}