variable "instnaces_count" {
#    default = {
#     mangodb = "t3.micro"
#     mysql = "t3.micro"
#     frontend = "t3.micro"
#    }

###for_each is having the list format
    default = ["mangodb", "redis", "frontend"]
}

variable "domain_name" {
    default = "bpotla.com"
 
}
