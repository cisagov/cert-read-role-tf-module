output "role" {
  description = "The IAM role to be used for reading certificate data for the host whose name is specified in the hostname input variable."
  value       = aws_iam_role.the_role
}
