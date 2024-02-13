terraform {
  backend "s3" {
    bucket = "emiledevopstest556373"
    key    = "test/directory/terraform.tfstate"
    region = "eu-west-1"
  }
}