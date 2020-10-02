# ------------------------------------------------------------------------------
# Required parameters
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "cert_bucket_name" {
  description = "The name of the AWS S3 bucket where certificates are stored"
}

variable "hostname" {
  description = "The FQDN corresponding to the certificate to be read (e.g. site.example.com)"
}

# ------------------------------------------------------------------------------
# Optional parameters
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "account_ids" {
  type        = list(string)
  description = "AWS account IDs that are to be allowed to assume the role"
  default     = []
}

variable "cert_path" {
  description = "The path to the certificates in the AWS S3 bucket.  For example, the certificate files for site.example.com are expected to live at <cert_path>/site.example.com/*"
  default     = "live"
}
