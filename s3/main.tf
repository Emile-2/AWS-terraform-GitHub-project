provider "aws" {
  region = "eu-west-1"
}

resource "aws_s3_bucket" "test_s3" {
  bucket = "emiledevopstest556373"

  tags = {
    Name        = "test_bucket"
    Environment = "dev"
  }
}

resource "aws_s3_object" "test" {
    bucket = aws_s3_bucket.test_s3.id
    key = "test/directory/"
  
}