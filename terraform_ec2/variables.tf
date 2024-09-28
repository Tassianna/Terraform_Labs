variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "eu-west-2"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_pair_name" {
  description = "Name of the existing AWS Key Pair to use for the EC2 instance"
  type        = string
  default     = "london_key"
}

variable "allowed_ip" {
  description = "The IP address allowed to access the EC2 instance via SSH"
  type        = string
  default     = "0.0.0.0/0"
}

variable "availability_zones" {
  description = "value"
  type        = list(string)
  default     = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
}
