data "aws_route53_zone" "hosted_zone" {
  name = join("", [var.domain, "."])
}

resource "aws_route53_record" "A_record" {
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  name    = "mc.${var.domain}"
  type    = "A"
  ttl     = "300"
  records = var.public_ips
}

resource "aws_route53_record" "SRV_record" {
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  name    = "mc.${var.domain}"
  type    = "SRV"
  ttl     = "300"
  records =  [for ip in var.public_ips : "0 10 25565 ${ip}."]
}