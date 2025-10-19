resource "aws_instance" "terraform" {
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.roboshop-allow_all_sg.id]
    tags = {
        Name = "terraform"
        Terraform = "true"
    }
}

resource "aws_security_group" "roboshop-allow_all_sg" {
  name   = "roboshop-allow-all-sg"

  egress {
    from_port        = 0 # from port 0 to to port 0 means all ports
    to_port          = 0 
    protocol         = "-1" # -1 means all protocols
    cidr_blocks      = ["0.0.0.0/0"] # internet
  }

  dynamic ingress {
    for_each = toset(var.ingress_rule)
    content {
      from_port        =  ingress.value
      to_port          =  ingress.value
      protocol         = "tcp" # -1 means all protocols
      cidr_blocks      = ["0.0.0.0/0"] # internet
      
    }
    
  }

  tags = {
    Name = "roboshop-allow-all-sg"
  }

}