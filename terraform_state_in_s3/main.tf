resource "aws_instance" "example" {
  ami           = "ami-01ec84b284795cbc7"
  instance_type = "t2.micro"
  key_name      = "london_key"


  provisioner "remote-exec" {

    inline = [
      "sudo apt update",
      "sudo apt install -y nginx"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("~/Desktop/london_key.pem")
      host        = self.public_ip
    }
  }

  tags = {
    Name = "My-Computer-Coolio"
  }
}
resource "aws_default_vpc" "default_vpc"{
    tags = {
        Name = "Default VPC"
  }
}
resource "aws_default_security_group" "default_sg" {
  vpc_id = aws_default_vpc.default_vpc.id
}

# Allow inbound SSH (port 22) in the default security group
resource "aws_security_group_rule" "allow_inbound_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = aws_default_security_group.default_sg.id
  cidr_blocks       = ["0.0.0.0/0"]  # Allow SSH from anywhere. You can restrict this to a specific IP range for security.
}