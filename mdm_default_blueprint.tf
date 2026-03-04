resource "zentral_mdm_blueprint" "default" {
  name                            = "Default"
  collect_apps                    = "ALL"
  collect_certificates            = "ALL"
  collect_profiles                = "ALL"
  legacy_profiles_via_ddm         = true
  filevault_config_id             = zentral_mdm_filevault_config.default.id
  recovery_password_config_id     = zentral_mdm_recovery_password_config.default.id
  software_update_enforcement_ids = [zentral_mdm_software_update_enforcement.default.id]
}

# FileVault

resource "zentral_mdm_filevault_config" "default" {
  name                         = "Default"
  escrow_location_display_name = "Zentral Cloud"
  at_login_only                = true
  bypass_attempts              = 0
  destroy_key_on_standby       = true
  show_recovery_key            = false
}

# Recovery password

resource "zentral_mdm_recovery_password_config" "default" {
  name = "Default"
}

# Software update enforcement

resource "zentral_mdm_software_update_enforcement" "default" {
  name           = "Default"
  platforms      = ["macOS"]
  max_os_version = "27"
  delay_days     = 7
  details_url    = "https://support.apple.com/en-us/122868"
}

# Bootstrap package

resource "zentral_mdm_blueprint_artifact" "bootstrap-pkg" {
  blueprint_id = zentral_mdm_blueprint.default.id
  artifact_id  = zentral_mdm_artifact.bootstrap-pkg.id
  macos        = true
}

# All

resource "zentral_mdm_blueprint_artifact" "servicemanagement" {
  blueprint_id = zentral_mdm_blueprint.default.id
  artifact_id  = zentral_mdm_artifact.servicemanagement.id
  macos        = true
}

# Santa

resource "zentral_mdm_blueprint_artifact" "santa-tcc" {
  blueprint_id = zentral_mdm_blueprint.default.id
  artifact_id  = zentral_mdm_artifact.santa-tcc.id
  macos        = true
}

resource "zentral_mdm_blueprint_artifact" "santa-system-extension-policy" {
  blueprint_id = zentral_mdm_blueprint.default.id
  artifact_id  = zentral_mdm_artifact.santa-system-extension-policy.id
  macos        = true
}

resource "zentral_mdm_blueprint_artifact" "santa-notificationsettings" {
  blueprint_id = zentral_mdm_blueprint.default.id
  artifact_id  = zentral_mdm_artifact.santa-notificationsettings.id
  macos        = true
}

resource "zentral_mdm_blueprint_artifact" "santa-default-configuration" {
  blueprint_id = zentral_mdm_blueprint.default.id
  artifact_id  = zentral_mdm_artifact.santa-default-configuration.id
  macos        = true
}

# Monolith

resource "zentral_mdm_blueprint_artifact" "monolith-default-enrollment" {
  blueprint_id = zentral_mdm_blueprint.default.id
  artifact_id  = zentral_mdm_artifact.monolith-default-enrollment.id
  macos        = true
}

resource "zentral_mdm_blueprint_artifact" "managedsoftwareupdate-tcc" {
  blueprint_id = zentral_mdm_blueprint.default.id
  artifact_id  = zentral_mdm_artifact.managedsoftwareupdate-tcc.id
  macos        = true
}

# Osquery

resource "zentral_mdm_blueprint_artifact" "osquery-tcc" {
  blueprint_id = zentral_mdm_blueprint.default.id
  artifact_id  = zentral_mdm_artifact.osquery-tcc.id
  macos        = true
}

resource "zentral_mdm_blueprint_artifact" "system-logging" {
  blueprint_id = zentral_mdm_blueprint.default.id
  artifact_id  = zentral_mdm_artifact.system-logging.id
  macos        = true
}
