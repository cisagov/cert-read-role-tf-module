# cert-read-role-tf-module #

[![Build Status](https://travis-ci.com/cisagov/cert-read-role-tf-module.svg?branch=develop)](https://travis-ci.com/cisagov/cert-read-role-tf-module)

A Terraform module for creating an IAM role for reading certificate
data for a specified host.

## Usage ##

```hcl
module "role_site.example.com" {
  source = "github.com/cisagov/cert-read-role-tf-module"

  providers = {
    aws = "aws"
  }

  account_ids = [
    "123456789012"
  ]
  cert_bucket_name = "cool-certificates"
  hostname         = "site.example.com"
}
```

## Examples ##

* [Basic usage](https://github.com/cisagov/cert-read-role-tf-module/tree/develop/examples/basic_usage)

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-------:|:--------:|
| account_ids | AWS account IDs that are to be allowed to assume the role | list(string) | [] | no |
| cert_bucket_name | The name of the AWS S3 bucket where certificates are stored | string | | yes |
| cert_path | The path to the certificates in the AWS S3 bucket.  For example, the certificate files for site.example.com are expected to live at <cert_bucket_path>/site.example.com/*. | string | "live" | no |
| hostname | The FQDN corresponding to the certificate to be read (e.g. site.example.com) | string | | yes |

## Outputs ##

| Name | Description |
|------|-------------|
| arn | The EC2 instance ARN |

## Contributing ##

We welcome contributions!  Please see [here](CONTRIBUTING.md) for
details.

## License ##

This project is in the worldwide [public domain](LICENSE).

This project is in the public domain within the United States, and
copyright and related rights in the work worldwide are waived through
the [CC0 1.0 Universal public domain
dedication](https://creativecommons.org/publicdomain/zero/1.0/).

All contributions to this project will be released under the CC0
dedication. By submitting a pull request, you are agreeing to comply
with this waiver of copyright interest.
