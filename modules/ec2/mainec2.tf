resource "aws_instance" "example" {
subnet_id = var.subnet
ami = var.ami
instance_type = var.instance_type
key_name = var.key_name
tags = {
Name = "example-instance"
}
  vpc_security_group_ids  = ["${aws_security_group.instance.id}"]
  user_data = <<-EOF
	      #!/bin/bash
	      sudo yum update -y && sudo yum install httpd -y && sudo systemctl start httpd && sudo systemctl enable httpd
	      EOF
}
 
 
resource "aws_security_group" "instance" {
 
  name = "terraform-example-instance"
  vpc_id = var.myvpc
 
  ingress {
 
    from_port	  = 80
 
    to_port	    = 80
 
    protocol	  = "tcp"
 
    cidr_blocks	= ["0.0.0.0/0"]
 
  }
    ingress {
 
    from_port	  = 22
 
    to_port	    = 22
 
    protocol	  = "tcp"
 
    cidr_blocks	= ["0.0.0.0/0"]
 
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
}

