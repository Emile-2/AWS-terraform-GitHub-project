provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "test_s3" {
  bucket = "emiledevopstest556373"

  tags = {
    Name        = var.bucket
    Environment = var.environment
  }
}

resource "aws_s3_object" "test" {
    bucket = aws_s3_bucket.test_s3.id
    key = "test/directory/"
  
}