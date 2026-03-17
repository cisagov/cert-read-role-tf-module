# Create an AWS IAM role for reading certificate information #

## Usage ##

To run this example you need to execute the `terraform init` command
followed by the `terraform apply` command.

Note that this example may create resources which cost money. Run
`terraform destroy` when you no longer need these resources.

<!-- BEGIN_TF_DOCS -->
## Requirements ##

| Name | Version |
| ---- | ------- |
| terraform | ~> 1.1 |
| aws | ~> 6.7 |

## Providers ##

| ---- | ------- |
No providers.
| Name | Version |
| aws | ~> 6.7 |

## Modules ##

| Name | Source | Version |
| ---- | ------ | ------- |
| cert\_role | ../../ | n/a |

## Resources ##

No resources.

## Inputs ##

No inputs.

## Outputs ##

| Name | Description |
| ---- | ----------- |
| role\_arn | The ARN corresponding to the IAM role to be used for reading certificate data for site.example.com |
<!-- END_TF_DOCS -->
