provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = "phong.test"
  acl    = "public-read"

  # Public access block configuration to allow public access
  public_access_block_configuration {
    block_public_acls   = false
    block_public_policy = false
  }
}
