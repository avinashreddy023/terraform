provider "aws" {
  profile    = "Terraform_user"
  access_key = "AKIASE4EPEM3CFFDNJVV"
  secret_key = "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"
  region     = "ap-southeast-2"
}

resource "aws_instance" "linux" {
  ami = "ami-080785a633a551d87"
  tags = {
    Name = "Linux-instance"
  }
  instance_type = "t2.micro"
  key_name      = "terraform-windows"
}

resource "aws_security_group" "allow_rdp" {
  tags = {
    Name = "allow_SG"
  }
  description = "allow_ssh"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
