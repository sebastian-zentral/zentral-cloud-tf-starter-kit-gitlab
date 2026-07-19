# MDM OTA enrollment disabled for the initial lab run.
#
# It requires two prerequisites that don't exist in a fresh tenant:
#   - an MDM push certificate named "Zentral Cloud" (a real Apple APNs cert), and
#   - an MDM SCEP issuer named "Zentral Cloud".
#
# Re-add the block below once both exist (name them "Zentral Cloud" or change the
# `name =` lookups to match what you created):
#
# data "zentral_mdm_push_certificate" "zentral-cloud" {
#   name = "Zentral Cloud"
# }
#
# data "zentral_mdm_scep_issuer" "zentral-cloud" {
#   name = "Zentral Cloud"
# }
#
# resource "zentral_mdm_ota_enrollment" "default" {
#   name                  = "Default"
#   display_name          = "Zentral Cloud"
#   blueprint_id          = zentral_mdm_blueprint.default.id
#   push_certificate_id   = data.zentral_mdm_push_certificate.zentral-cloud.id
#   scep_issuer_id        = data.zentral_mdm_scep_issuer.zentral-cloud.id
#   meta_business_unit_id = zentral_meta_business_unit.default.id
# }
