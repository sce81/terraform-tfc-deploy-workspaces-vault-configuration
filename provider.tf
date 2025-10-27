terraform {
  cloud {
    organization = "HashiCorp_TFC_Automation_Demo"

    workspaces {
      name    = "deploy-workspaces-vault-namespaces"
      project = "Workspace_Management"
    }
  }
  required_providers {
    tfe = {
      version = "~> 0.70.0"
      source  = "hashicorp/tfe"
    }
  }
}