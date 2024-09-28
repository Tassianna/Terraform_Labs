region = "eu-west-2"

#availability_zone = {
#private_subnet_az = "eu-west-2b"
#public_subnet_az  = "eu-west-2a"
#}

cidr_block = "10.0.0.0/16"

vpc_name = "myVpc-tassi"

#public_subnet_cidr_block = "10.0.1.0/24"

#private_subnet_cidr_block = "10.0.2.0/24"

ami_image = "ami-01ec84b284795cbc7"
instance_type = "t2.micro"
key_name      = "london_key"

#########################block of instances#######################
instances = {
  public_ec2 = {
    availability_zone           = "eu-west-2a"
    vpc_security_group          = true
    subnet                      = "public_subnet"
    associate_public_ip_address = true
    user_data                   = <<-EOF
        #!/bin/bash
        sudo apt update -y
        sudo apt install apache2 -y
        sudo systemctl start apache2
        sudo systemctl enable apache2
        echo "<html><body><h1>Hi there! This is Tassi’s public VM</h1></body></html>" > /var/www/html/index.html
        EOF
  }

  private_ec2 = {
    availability_zone           = "eu-west-2b"
    subnet                      = "private_subnet"
    vpc_security_group          = false
    associate_public_ip_address = false
    user_data                   = <<-EOF
        #!/bin/bash
        sudo apt update -y
        sudo apt install apache2 -y
        sudo systemctl start apache2
        sudo systemctl enable apache2
        echo "<html><body><h1>Hi there</h1></body></html>" > /var/www/html/index.html
        EOF
  }
}




#################create multiple blocks of resource subnets################

subnets = {
  public_subnet = {

    cidr_block = "10.0.1.0/24"

    map_public_ip_on_launch = true

    availability_zone = "eu-west-2a"

  }

  private_subnet = {

    cidr_block = "10.0.2.0/24"

    map_public_ip_on_launch = false

    availability_zone = "eu-west-2b"
  }
}

############################inbound rules################################
inbound_rule = {
  allow_http_traffic = {

    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  allow_ssh_traffic = {


    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
}