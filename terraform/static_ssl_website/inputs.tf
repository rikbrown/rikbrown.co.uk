variable "domain_name" {
  type = "string"
}

variable "acm_certificate_arn" {}

variable "distribution_price_class" {
    default = "PriceClass_100"
}

variable "hosted_zone_id" {}
