locals {
  # If var.role_description contains two instances of "%s", use format()
  # to replace the first "%s" with var.hostname and the second "%s"
  # with var.cert_bucket_name, otherwise just use var.role_description as is
  role_description = length(regexall(".*%s.*%s.*", var.role_description)) > 0 ? format(var.role_description, var.hostname, var.cert_bucket_name) : var.role_description

  # If var.role_name contains one instance of "%s", use format()
  # to replace the "%s" with var.hostname, otherwise just use
  # var.role_name as is.  If the role name is longer than 64 characters
  # (the current AWS limit), truncate it to the first 64 characters.
  role_name = substr(length(regexall(".*%s.*", var.role_name)) > 0 ? format(var.role_name, var.hostname) : var.role_name, 0, 64)
}
