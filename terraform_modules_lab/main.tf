

#######################london module###########################

module "uk" {
  source = "./modules"
  #providers = {
  # aws.src = aws.uk
  #}
  ami_id                 = "ami-01ec84b284795cbc7"    ####ec2###
  instance_type          = "t2.micro"                 ####ec2###
  key_name               = "london_key"               ####ec2###
  security_group_ids     = ["sg-012db3e8d390bc0f6"]   ####ec2###
  subnet_id              = "subnet-071d6dad6f8b4f7ce" ####ec2###
  instance_name          = "my_uk_instance_module"    ####ec2###
  region                 = "eu-west-2"                ####ec2###
  bucket_name            = "tassis-bucket-in-uk"      ####s3####
  bucket_tag_name        = "My Bucket in UK"          ####s3####
  bucket_env             = "Dev"                      ####s3####
  table_name             = "my-table-uk"              ####rd####
  hash_key               = "my-hash-key-uk"           ####rd####
  billing_mode           = "PAY_PER_REQUEST"          ####rd####
  dynamodb_hash_key_type = "S"
}



#######################oregon module###########################
module "us" {
  source = "./modules"
  #providers = {
  # aws.src = aws.us
  #}
  ami_id                 = "ami-05134c8ef96964280"    ####ec2###
  instance_type          = "t2.micro"                 ####ec2###
  key_name               = "oregon_key"               ####ec2###
  security_group_ids     = ["sg-0f22c4612d7aaaf90"]   ####ec2###
  subnet_id              = "subnet-0a2b87b392041df30" ####ec2###
  instance_name          = "my_us_instance_module"    ####ec2###
  region                 = "us-west-2"                ####ec2###
  bucket_name            = "tassis-bucket-in-us"      ####s3####
  bucket_tag_name        = "My Bucket in US"          ####s3####
  bucket_env             = "Dev"                      ####s3####
  table_name             = "my-table-us"              ####rd####
  hash_key               = "my-hash-key-us"           ####rd####
  billing_mode           = "PAY_PER_REQUEST"          ####rd####
  dynamodb_hash_key_type = "S"                        ####rd####

}

