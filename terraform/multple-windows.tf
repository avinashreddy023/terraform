provider "aws" {
  profile    = "Terraform_user"
  access_key = "AKIASE4EPEM3CFFDNJVV"
  secret_key = "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"
  region     = "ap-southeast-2"
}

resource "aws_instance" "windows" {
  ami = "ami-0d737c54c2d417954"
  tags = {
    Name = "windows-1"
  }
  instance_type = "t2.micro"
  count         = 3
  key_name      = "terraform-windows"
}

resource "aws_security_group" "rdp" {
  tags = {
    Name = "security_ssh"
  }
  description = "allow_ssh"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
