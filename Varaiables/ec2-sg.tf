resource "aws_instance" "terraform_Bharathi" {
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.allow_all_sg_test.id]
    tags = var.ec2_tags
}

resource "aws_security_group" "allow_all_sg_test" {
  name   = "allow-all-sg_test"

  egress {
    from_port        = var.ports_inbound_outbound # from port 0 to to port 0 means all ports
    to_port          = var.ports_inbound_outbound
    protocol         = "-1" # -1 means all protocols
    cidr_blocks      = var.cidr_inbound_outbound # internet
  }

  ingress {
    from_port        = var.ports_inbound_outbound # from port 0 to to port 0 means all ports
    to_port          = var.ports_inbound_outbound
    protocol         = "-1" # -1 means all protocols
    cidr_blocks      = var.cidr_inbound_outbound # internet
  }

  tags = var.sg_tags
}