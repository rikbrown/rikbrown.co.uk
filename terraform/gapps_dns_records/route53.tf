resource "aws_route53_record" "gapps_mx" {
  zone_id = "${var.hosted_zone_id}"
  name    = ""
  type    = "MX"

  records = [
    "1 ASPMX.L.GOOGLE.COM",
    "5 ALT1.ASPMX.L.GOOGLE.COM",
    "5 ALT2.ASPMX.L.GOOGLE.COM",
    "10 ASPMX2.GOOGLEMAIL.COM",
    "10 ASPMX3.GOOGLEMAIL.COM",
  ]

  ttl = "${var.ttl}"
}
