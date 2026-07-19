resource "zentral_monolith_manifest" "default" {
  name                  = "Default"
  meta_business_unit_id = zentral_meta_business_unit.default.id
}

# enrollment

resource "zentral_monolith_enrollment" "default" {
  manifest_id           = zentral_monolith_manifest.default.id
  meta_business_unit_id = zentral_meta_business_unit.default.id
}

# repository / catalog / manifest-catalog removed for the initial lab run:
# they require a monolith repository named "Zentral Cloud" with a synced
# "production" catalog. Re-add once the repository + catalog exist.

# enrollment packages

resource "zentral_monolith_manifest_enrollment_package" "munki" {
  manifest_id   = zentral_monolith_manifest.default.id
  enrollment_id = zentral_munki_enrollment.default.id
  builder       = "zentral.contrib.munki.osx_package.builder.MunkiZentralEnrollPkgBuilder"
}

resource "zentral_monolith_manifest_enrollment_package" "osquery" {
  manifest_id   = zentral_monolith_manifest.default.id
  enrollment_id = zentral_osquery_enrollment.default.id
  builder       = "zentral.contrib.osquery.osx_package.builder.OsqueryZentralEnrollPkgBuilder"
}

# sub manifest

resource "zentral_monolith_manifest_sub_manifest" "default-agents" {
  manifest_id     = zentral_monolith_manifest.default.id
  sub_manifest_id = zentral_monolith_sub_manifest.agents.id
}
