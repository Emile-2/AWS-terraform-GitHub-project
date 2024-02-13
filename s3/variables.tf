variable "bucket" {
  description = "S3 Bucket Name"
  type        = string
}


variable "aws_region" {
  description = "AWS Region selected for resources"
  type        = string
}


variable "environment" {
  description = "Infrastrcture environment"
  type        = string
}
