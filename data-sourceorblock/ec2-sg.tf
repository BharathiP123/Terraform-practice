resource "aws_instance" "terraform_Bharathi" {
    ami = local.amiid
    instance_type = local.instancetype
    vpc_security_group_ids = [aws_security_group.allow_all_sg_test.id]
    tags = local.ec2_tags
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

  tags = merge(
    var.common_tags,
    {
      Name = "${local.comm_tag}-allow-all"
    }
  )
}