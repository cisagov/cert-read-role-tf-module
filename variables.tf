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
  description = "The description to associate with the IAM role that allows read-only access to the certificate in the specified S3 bucket.  Note that the first \"%s\" in this value will get replaced with the hostname variable and the second \"%s\" will get replaced with the cert_bucket_name variable."
  default     = "Allows read-only access to the certificate data for %s from the %s S3 bucket."
}

variable "role_name" {
  type        = string
  description = "The name to assign the IAM role that allows read-only access to the certificate in the specified S3 bucket.  Note that the \"%s\" in this value will get replaced with the hostname variable."
  default     = "CertificateReadOnly-%s"
}
