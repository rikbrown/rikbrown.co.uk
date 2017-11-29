# rikbrown.co.uk

Personal website.

## Cloudformation/Sceptre

Cloudformation for this site (using Sceptre) creates:

* a S3 bucket to store the static assets (`public_html/**/*`) and redirects for non-primaty domains.
* DNS 
  * the hosted zone for `rikbrown.co.uk`
  * A records pointing `www.` and root to the S3 buckets
  * MX records for Google Apps
* a code pipeline which automatically updates the S3 bucket when we commit to Github.

```bash
export GITHUB_TOKEN=<secret!>
export AWS_PROFILE=sceptre
sceptre launch-env dev
```
