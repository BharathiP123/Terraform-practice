resource "aws_route53_record" "test" {
  count =  5
  zone_id = "Z03518071VI2MRRCQX1QH"
  name    =  "${var.instnaces_count[count.index]}" == "frontend" ? "${var.domain_name}" :  "${var.instnaces_count[count.index]}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = "${var.instnaces_count[count.index]}" == "frontend" ? [aws_instance.terraform_test[count.index].public_ip] : [aws_instance.terraform_test[count.index].private_ip]
}