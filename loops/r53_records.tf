resource "aws_route53_record" "route53_record" {
  count   = 10
  zone_id = var.rout53_zone_id
  name    = "${var.instances[count.index]}.${var.rout53_domain_name}" # mongodb.neeli.online
  type    = "A"
  ttl     = 1
  records = [aws_instance.roboshop[count.index].private_ip]
}