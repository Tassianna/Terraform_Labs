#########################rd#########################
variable "table_name" {
    type = string
} 

variable "hash_key" {
    type = string
} 

variable "billing_mode" {
    description = "The billing mode for DynamoDB (PAY_PER_REQUEST or PROVISIONED)"
    type = string
} 

variable "dynamodb_hash_key_type" {
  description = "The data type for the hash key (S for String, N for Number, B for Binary)"
  type        = string
  default     = "S" 
}

##########################ec2#######################
variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ami_id"{
  type = string
}

variable "key_name"{
  type = string
}
variable "security_group_ids"{
  description = "List of security group IDs"
  type        = list(string)
}

variable "subnet_id" {
  type = string
}

variable "instance_name" {
  type = string
}

variable "region" {
  type    = string
  default = "us-east-1"
}


########################s3###################

variable "bucket_name"{
    type = string
}

variable "bucket_tag_name"{
    type = string
}

variable "bucket_env"{
    type = string
}
