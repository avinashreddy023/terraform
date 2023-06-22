provider"aws"{
profile="Terraform_user"
access_key="AKIASE4EPEM3CFFDNJVV"
secret_key="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"
region="ap-southeast-2"
}

resource"aws_instance""web"{
tags={
Name="web-instance"
}
ami="ami-080785a633a551d87"
instance_type="t2.micro"
key_name="terraform-windows"
user_data=file("script.sh") # calling script
security_groups=["${aws_security_group.http.name}"]
}

resource"aws_security_group""http"{
tags={
Name="web-ssh"
}
name="ssh"
description="security for web"
ingress{
from_port=22
to_port=22
protocol="tcp"
cidr_blocks=["0.0.0.0/0"] # to provide Ipv4 address this is the syntax
ipv6_cidr_blocks=["::/0"] # to provide Ipv6 address this is the syntax
}


ingress{
description="allow https from vpc"
from_port=80
to_port=80
protocol="tcp"
cidr_blocks=["0.0.0.0/0"]
ipv6_cidr_blocks=["::/0"]
}

egress{ # outbound
from_port=0
to_port=0
protocol="-1"
cidr_blocks=["0.0.0.0/0"]
ipv6_cidr_blocks=["::/0"]
}

}

