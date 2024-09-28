terraform {
  backend "s3" {
    bucket         = "state-bucket-ec2-tassi"
    key            = "terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "statelock"
  }
}
provider "aws" {
  region = "eu-west-2"
}