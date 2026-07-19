terraform {
  required_providers {
    zentral = {
      source  = "zentralopensource/zentral"
      version = ">= 0.1.74"
    }
  }

  // Zentral as the Terraform HTTP state backend. A backend block cannot use
  // variables, so address/lock_address/unlock_address + username/password are
  // supplied at `terraform init` time via -backend-config (see .gitlab-ci.yml).
  // The state object (slug "starter-kit") is auto-created on the first push.
  backend "http" {
    lock_method   = "POST"
    unlock_method = "DELETE"
  }
}

// configure the provider
provider "zentral" {
  // URL where the API endpoints are mounted in the Zentral deployment.
  // The ZTL_API_BASE_URL environment variable can be used instead.
  base_url = "https://${var.fqdn}/api/"

  // Zentral service account (better) or user API token.
  // This is a secret, it must be managed using a variable.
  // The ZTL_API_TOKEN environment variable can be used instead.
  token = var.api_token
}
