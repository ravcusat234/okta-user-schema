variable "org_name" {}
variable "api_token" {}
variable "base_url" {}

# Enable and configure the Okta provider
terraform {
  required_providers {
    okta = {
      source  = "okta/okta"
      version = "~> 3.15"
    }
  }
}

provider "okta" {
    org_name = var.org_name
    base_url = var.base_url
    api_token = var.api_token
}
resource "okta_user_schema_property" "passport_extension" {
  index  = "passport"
  title  = "Passport"
  type   = "string"
  master = "PROFILE_MASTER"
}
resource "okta_user_schema_property" DOB_extension{
   index="date_of_birth"
   title="Date Of Birth"
   type= "string"
   master="PROFILE_MASTER"
}
resource "okta_user_schema_property" "crn_extension" {
  index  = "customer_reference_number"
  title  = "Customer Reference Number"
  required = true
  type   = "string"
  master = "PROFILE_MASTER"
}

resource "okta_group" "exampleGroupForTerraformIntegration" {
  name        = "GroupcreatedfromTerraform"
  description = "My Example Group for Terraform"
}
