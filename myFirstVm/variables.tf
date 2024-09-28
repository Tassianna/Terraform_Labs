variable "ami_image_name" {

  default = "ami-01ec84b284795cbc7" #Choose a valid AMI image according to the region and operating system you wish to deploy

  type = string

  description = "This is a variable for AMI image"

}

variable "instance_type" {

  type = string

  description = "This is a variable for Instance type"

}
