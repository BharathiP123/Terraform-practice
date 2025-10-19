locals {
  instancetype = var.instance_type
  comm_tag = "${var.project}-${var.environment}"
  amiid = "${data.aws_ami.myami.id}"
  ec2_tags = merge(
      var.common_tags, 
      {      
      Name = "${local.comm_tag}-local-demo"
      }
    )

}