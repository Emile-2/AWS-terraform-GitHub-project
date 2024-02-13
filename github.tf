terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}


provider "github" {
}

resource "github_repository" "example" {
  name        = "MyTerraformTest"
  description = "Terraform Test"

  visibility = "public"

}