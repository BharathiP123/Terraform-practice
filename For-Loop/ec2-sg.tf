resource "aws_instance" "myterraform_test" {
    for_each = toset(var.instnaces_count)
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_all_sg_myterraform_test.id]
    tags = {
        Name = each.value
        Terraform = "true"
    }
}

resource "aws_security_group" "allow_all_sg_myterraform_test" {
  name   = "allow-all-sg_myterraform_test"

  egress {
    from_port        = 0 # from port 0 to to port 0 means all ports
    to_port          = 0 
    protocol         = "-1" # -1 means all protocols
    cidr_blocks      = ["0.0.0.0/0"] # internet
  }

  ingress {
    from_port        = 0 # from port 0 to to port 0 means all ports
    to_port          = 0 
    protocol         = "-1" # -1 means all protocols
    cidr_blocks      = ["0.0.0.0/0"] # internet
  }

  tags = {
    Name = "allow-all-sg_myterraform_test"
  }

}