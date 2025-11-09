module "TFE_Workspace_Vault_Namespaces" {
  for_each = local.workspace_vars.vault_namespace_vars

  source                        = "app.terraform.io/HashiCorp_AWS_Org/workspace-management/tfe"
  version                       = "4.0.1"
  name                          = "hcp_workspace_vault_namespace_${each.key}"
  organization                  = data.tfe_organization.main.name
  vcs_repo                      = local.vault_configuration_repo
  tfe_variables                 = each.value
  project_id                    = data.tfe_project.main.id
  structured_run_output_enabled = "false"
  workspace_tags = {
    "identifier" = each.key,
    "platform"   = "hcp",
    "target"     = "vault",
    "project"    = data.tfe_project.main.id
    "env"        = "vault-configuration"
  }
  sentinel_policy = []
  auto_apply      = true
}