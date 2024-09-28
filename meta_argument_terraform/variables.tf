variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ami" {
  type = string
}

variable "region" {
  type = string
}


variable "ec2_name" {
  type = set(string)
}