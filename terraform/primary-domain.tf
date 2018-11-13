resource "aws_route53_zone" "primary_domain" {
  name = "${var.primary_domain}"
}

module "gapps_dns_records" {
  source = "./gapps_dns_records"
  hosted_zone_id = "${aws_route53_zone.primary_domain.zone_id}"
}

module "static_ssl_website" {
  source = "./static_ssl_website"

  domain_name = "www.${var.primary_domain}"
  acm_certificate_arn = "${var.primary_domain_certificate_arn}"
  hosted_zone_id = "${aws_route53_zone.primary_domain.zone_id}"
}
