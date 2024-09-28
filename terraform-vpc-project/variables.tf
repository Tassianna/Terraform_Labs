variable "cidr_block" {
  type        = string
  description = "CIDR block for VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  type        = string
  description = "VPC Name"
}

variable "public_subnet_cidr_block" {
  type        = string
  default     = "10.0.1.0/24"
  description = "cidr range for public subnet"
}

variable "private_subnet_cidr_block" {
  type        = string
  default     = "10.0.2.0/24"
  description = "cidr range for private subnet"
}

variable "region" {
  type        = string
  default     = "eu-west-2"
  description = "default region where infrastructures will be provisioned"
}

variable "availability_zone" {
  type = map(string)
  default = {
    private_subnet_az = "eu-west-2b"
    public_subnet_az  = "eu-west-2a"
  }
}

variable "ami_image" {
  type = string
}
variable "key_name" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

#pass all the values required for the subnet
variable "subnets" {
  type = map(object({
    cidr_block = string

    map_public_ip_on_launch = bool

    availability_zone = string
  }))
}

variable "inbound_rule" {
  type = any
}

variable "instances" {
  type = map(object({
    availability_zone           = string
    vpc_security_group          = bool
    subnet                      = string
    user_data                   = string
    associate_public_ip_address = bool
  }))
}