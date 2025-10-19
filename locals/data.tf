data "aws_ami" "myami"{
    owners = ["973714476881"]
    most_recent      = true
    filter {
    name   = "virtualization-type"
    values = ["hvm"]
    }
    filter {
    name = "root-device-type"
    values = ["ebs"]
    }
    filter {
    name = "name"
    values = ["RHEL-9-DevOps-Practice"]
    }

}

# output "myami_name" {
#     value = data.aws_ami.myami
# }

output "myami_name" {
    value = data.aws_ami.myami.id
}
