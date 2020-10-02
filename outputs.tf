output "role" {
  value       = aws_iam_role.the_role
  description = "The IAM role to be used for reading certificate data for the specified hostname"
}
