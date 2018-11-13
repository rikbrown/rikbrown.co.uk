resource "aws_s3_bucket" "website_bucket" {
  bucket = "${var.domain_name}-content"
  acl    = "private"
}

resource "aws_s3_bucket_policy" "website_bucket_policy" {
  bucket = "${aws_s3_bucket.website_bucket.id}"
  policy = "${data.aws_iam_policy_document.s3_policy.json}"
}

data "aws_iam_policy_document" "s3_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.website_bucket.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = ["${aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn}"]
    }
  }

  statement {
    actions   = ["s3:ListBucket"]
    resources = ["${aws_s3_bucket.website_bucket.arn}"]

    principals {
      type        = "AWS"
      identifiers = ["${aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn}"]
    }
  }
}
