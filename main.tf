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
resource "okta_group" "exampleusingTF" {
  name        = "ExampleUsingTF"
  description = "My Example Group using TF"
}

resource "okta_user_schema_property" "DOB" {
  index       = "DateOfBirth"
  title       = "DateOfBirth"
  type        = "string"
  description = "My custom property DateOfBirth"
  master      = "PROFILE_MASTER"
}
resource "okta_group" "exampleusingTFNewNew" {
  name        = "ExampleUsingTFNewNew"
  description = "My Example Group using TFNew"
}


