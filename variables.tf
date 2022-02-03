# ------------------------------------------------------------------------------
# Required parameters
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "cert_bucket_name" {
  type        = string
  description = "The name of the AWS S3 bucket where certificates are stored."
}

variable "hostname" {
  type        = string
  description = "The FQDN corresponding to the certificate to be read (e.g. site.example.com)."
}

# ------------------------------------------------------------------------------
# Optional parameters
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "account_ids" {
  type        = list(string)
  description = "AWS account IDs that are to be allowed to assume the role."
  default     = []
}

variable "cert_path" {
  type        = string
  description = "The path to the certificates in the AWS S3 bucket.  For example, the certificate files for site.example.com are expected to live at <cert_path>/site.example.com/*."
  default     = "live"
}

variable "role_description" {
  type        = string
  description = "The description to associate with the IAM role that allows read-only access to the certificate in the specified S3 bucket.  Note that the first \"%s\" in this value will get replaced with the hostname variable and the second \"%s\" will get replaced with the cert_bucket_name variable.  If there are less than two instances of \"%s\" present in this value, no replacements will be made and the value will be used as is.  Including more than two instances of \"%s\" in this value will result in a Terraform error, so don't do that."
  default     = "Allows read-only access to the certificate data for %s from the %s S3 bucket."
}

variable "role_name" {
  type        = string
  description = "The name to assign the IAM role that allows read-only access to the certificate in the specified S3 bucket.  Note that the \"%s\" in this value will get replaced with the hostname variable.  If there are no instances of \"%s\" present in this value, no replacement will be made and the value will be used as is.  Including more than one instance of \"%s\" in this value will result in a Terraform error, so don't do that.  If the role name is longer than the current AWS limit of 64 characters (either as-is or after hostname replacement), the role name will be truncated to the first 64 characters."
  default     = "CertificateReadOnly-%s"
}
