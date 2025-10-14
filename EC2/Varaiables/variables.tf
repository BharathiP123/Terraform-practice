variable "ami_id" {
    default = "ami-09c813fb71547fc4f"
}
variable "instance_type" {
    type = string
    # default = "t3.micro"
  
}
variable "ec2_tags" {
    type = map(string)
        default = {
            Name = "terraform"
            Terraform = "true" 
        }
  
}

variable "ports_inbound_outbound" {
    type = number
    default = 0
  
}

variable "cidr_inbound_outbound" {
    type = list
    default = ["0.0.0.0/0"]

}
variable "sg_tags" {
    type = map(string)
    default = {
      Name = "allow-all-sg"
    }
  
}
