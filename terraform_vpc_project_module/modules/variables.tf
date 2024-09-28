variable "region"{
   type = string
}

variable "vpc_name"{
    type = string
}

variable "cidr"{
    type = string
}

variable "public_subnet_cidr_block" {
    type = string
    description = "cidr range for public subnet"
}

variable "private_subnet_cidr_block" {
    type = string
    description = "cidr range for private subnet"
}

variable "availability_zone" {
  type = map(string)
}

variable "instance_type" {
    type = string

}

variable "ami_image" {
    type = string
}

variable "key_name"{
    type = string
}