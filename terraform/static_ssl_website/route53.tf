resource "aws_route53_record" "record" {
    zone_id = "${var.hosted_zone_id}"
    name    = "${var.domain_name}"
    type    = "A"

    alias {
        name                   = "${aws_cloudfront_distribution.website_distribution.domain_name}"
        zone_id                = "${aws_cloudfront_distribution.website_distribution.hosted_zone_id}"
        evaluate_target_health = false
    }
}
