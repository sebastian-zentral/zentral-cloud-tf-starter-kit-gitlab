resource "zentral_monolith_sub_manifest" "agents" {
  name        = "Required agents"
  description = "The required agents for our standard macOS client"
}

# The sub-manifest pkg_infos below reference PkgInfo names that must exist in a
# monolith repository catalog (munkitools / osquery / santa). The VIRTUAL "Zentral
# Cloud" repo has no content yet, so they 400 with "Unknown PkgInfo name".
# Re-add once those PkgInfos exist in the repo.
#
# resource "zentral_monolith_sub_manifest_pkg_info" "munkitools" {
#   sub_manifest_id = zentral_monolith_sub_manifest.agents.id
#   key             = "managed_installs"
#   pkg_info_name   = "munkitools"
# }
#
# resource "zentral_monolith_sub_manifest_pkg_info" "osquery" {
#   sub_manifest_id = zentral_monolith_sub_manifest.agents.id
#   key             = "managed_installs"
#   pkg_info_name   = "osquery"
# }
#
# resource "zentral_monolith_sub_manifest_pkg_info" "santa" {
#   sub_manifest_id = zentral_monolith_sub_manifest.agents.id
#   key             = "managed_installs"
#   pkg_info_name   = "santa"
# }
