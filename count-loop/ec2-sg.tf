resource "aws_instance" "terraform_test" {
    count = 5
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_all_sg_count.id]
    tags = {
        Name = var.instnaces_count[count.index]
        Terraform = "true"
    }
}

resource "aws_security_group" "allow_all_sg_count" {
  name   = "allow-all-sg_count"

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
    Name = "allow-all-sg_count"
  }
}