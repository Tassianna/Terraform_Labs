provider "aws" {
  region = "eu-north-1"
}
resource "aws_s3_bucket" "my_first_bucket" {
  bucket = "my-first-terraform-bucket-tassianna" 
}