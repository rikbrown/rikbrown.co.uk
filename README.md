# rikbrown.co.uk

Personal website.

## Cloudformation/Sceptre

Cloudformation for this site (using Sceptre) creates:

* a S3 bucket to store the static assets (`public_html/**/*`) and redirect buckets for non-primary domains.
* a Cloudfront distribution in front of this for SSL
* DNS
  * the hosted zone for:
    * `rikbrown.co.uk`
    * `rik.codes`
    * `rik.email`
    * and others
  * **A** records pointing `www.` and root to the S3 buckets
  * **MX** records for Google Apps
* a code pipeline which automatically updates the static asset S3 bucket when we commit to Github.

```bash
export GITHUB_TOKEN=<secret!>
export AWS_PROFILE=sceptre
cd cloudformation
sceptre launch-env dev
```
