# cert-read-role-tf-module #

[![GitHub Build Status](https://github.com/cisagov/cert-read-role-tf-module/workflows/build/badge.svg)](https://github.com/cisagov/cert-read-role-tf-module/actions)

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

You will also need a "meta-role" that you can assume for the purposes
of creating the IAM role for reading host-specific certificate data.
This meta-role requires a permission policy similar to the following:

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "iam:GetRole",
                "iam:ListInstanceProfilesForRole",
                "iam:DeleteRolePolicy",
                "iam:CreateRole",
                "iam:DeleteRole",
                "iam:UpdateRole",
                "iam:PutRolePolicy",
                "iam:GetRolePolicy"
            ],
            "Resource": "arn:aws:iam::123456789012:role/CertificateReadOnly-*"
        }
    ]
}
```

## Examples ##

- [Basic usage](https://github.com/cisagov/cert-read-role-tf-module/tree/develop/examples/basic_usage)

<!-- BEGIN_TF_DOCS -->
## Requirements ##

| Name | Version |
|------|---------|
| terraform | ~> 1.0 |
| aws | ~> 4.9 |

## Providers ##

| Name | Version |
|------|---------|
| aws | ~> 4.9 |

## Modules ##

No modules.

## Resources ##

| Name | Type |
|------|------|
| [aws_iam_role.the_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.cert_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_policy_document.assume_role_doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.cert_doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| account\_ids | AWS account IDs that are to be allowed to assume the role. | `list(string)` | `[]` | no |
| cert\_bucket\_name | The name of the AWS S3 bucket where certificates are stored. | `string` | n/a | yes |
| cert\_path | The path to the certificates in the AWS S3 bucket.  For example, the certificate files for site.example.com are expected to live at <cert\_path>/site.example.com/*. | `string` | `"live"` | no |
| hostname | The FQDN corresponding to the certificate to be read (e.g. site.example.com). | `string` | n/a | yes |
| role\_description | The description to associate with the IAM role that allows read-only access to the certificate in the specified S3 bucket.  Note that the first "%s" in this value will get replaced with the hostname variable and the second "%s" will get replaced with the cert\_bucket\_name variable.  If there are less than two instances of "%s" present in this value, no replacements will be made and the value will be used as is.  Including more than two instances of "%s" in this value will result in a Terraform error, so don't do that. | `string` | `"Allows read-only access to the certificate data for %s from the %s S3 bucket."` | no |
| role\_name | The name to assign the IAM role that allows read-only access to the certificate in the specified S3 bucket.  Note that the "%s" in this value will get replaced with the hostname variable.  If there are no instances of "%s" present in this value, no replacement will be made and the value will be used as is.  Including more than one instance of "%s" in this value will result in a Terraform error, so don't do that.  If the role name is longer than the current AWS limit of 64 characters (either as-is or after hostname replacement), the role name will be truncated to the first 64 characters. | `string` | `"CertificateReadOnly-%s"` | no |

## Outputs ##

| Name | Description |
|------|-------------|
| role | The IAM role to be used for reading certificate data for the host whose name is specified in the hostname input variable. |
<!-- END_TF_DOCS -->

## Notes ##

Running `pre-commit` requires running `terraform init` in every directory that
contains Terraform code. In this repository, these are the main directory and
every directory under `examples/`.

## Contributing ##

We welcome contributions!  Please see [`CONTRIBUTING.md`](CONTRIBUTING.md) for
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
