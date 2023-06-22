provider "aws" {
  profile    = "Terraform_user"
  access_key = "AKIASE4EPEM3CFFDNJVV"
  secret_key = "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"
  region     = "ap-southeast-2"
}

resource "aws_instance" "windows" {
  ami = "ami-0d737c54c2d417954"
  tags = {
    Name = "windows"
  }
  instance_type = "t2.micro"
  key_name      = "terraform-windows"
}

resource "aws_security_group" "rdp" {
  name        = "allow_rdp"
  description = "allow rdp"
  ingress {
    from_port   = 3389 # by default this is windows server
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
