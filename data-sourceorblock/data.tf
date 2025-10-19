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

output "myami_name" {
    value = data.aws_ami.myami
}

data "aws_instance" "redis" {
  instance_id = "i-0e8f941e2e112dc06"
  }

  output "redis_info"{
    value = data.aws_instance.redis
  }