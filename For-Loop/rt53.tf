resource "aws_route53_record" "test" {
  for_each = toset(var.instnaces_count)
  zone_id = "Z03518071VI2MRRCQX1QH"
  name    =  each.value == "frontend" ? "${var.domain_name}" : "${each.value}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  allow_overwrite = true
  records =  each.value == "frontend" ? [aws_instance.myterraform_test[each.value].public_ip] : [aws_instance.myterraform_test[each.value].private_ip]
}