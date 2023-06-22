provider "aws" {
  profile    = "Terraform_user"
  access_key = "AKIASE4EPEM3CFFDNJVV"
  secret_key = "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"
  region     = "ap-southeast-2"
}

resource "aws_instance" "linux" {
  ami = "ami-080785a633a551d87"
  tags = {
    Name = "Linux1"
    Name = "Linux2"
  }
  count         = 2
  instance_type = "t2.micro"
  key_name      = "terraform-windows"
}

resource "aws_security_group" "rdp" {
  tags = {
    Name = "Linux_SSH"
  }
  name = "SSH"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
