variable "primary_domain" {
  default = "rikbrown.co.uk"
}

variable "alias_domains" {
  default = [
    "rik.codes",
    "rik.email",
    "rik.systems",
    "rik.today",
    "xn--12c1e5b.com",
  ]
}

variable "primary_domain_certificate_arn" {
  default = "arn:aws:acm:us-east-1:487129032168:certificate/0614e155-5b2b-4c82-a263-19bebf7e0df7"
}
