module "vpc" {
  source        = "../modules"
  region        = "eu-west-2"
  vpc_name      = "my-vpc-module"
  cidr          = "10.0.0.0/16"
  ami_image     = "ami-01ec84b284795cbc7"
  instance_type = "t2.macro"
  key_name      = "london_key"
  availability_zone = {
    private_subnet_az = "eu-west-2b"
    public_subnet_az  = "eu-west-2a"
  }
  private_subnet_cidr_block = "10.0.2.0/24"
  public_subnet_cidr_block  = "10.0.1.0/24"

}