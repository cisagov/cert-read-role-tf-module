output "role_arn" {
  value       = module.cert_role.role.arn
  description = "The ARN corresponding to the IAM role to be used for reading certificate data for site.example.com"
}
