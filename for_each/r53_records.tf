resource "aws_route53_record" "route53_record" {
  for_each = aws_instance.roboshop # output

  zone_id         = var.rout53_zone_id
  name            = "${each.key}.${var.rout53_domain_name}" # mongodb.neeli.online
  type            = "A"
  ttl             = 1
  records         = [each.value.private_ip]
  allow_overwrite = true
}