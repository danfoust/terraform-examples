output "s3_bucket_terraform_state_arn" {
  description = "The ARN of the S3 bucket that stores terraform state"
  value       = aws_s3_bucket.terraform_state.arn
}

output "s3_bucket_terraform_state_name" {
  description = "The name of the S3 bucket that stores terraform state"
  value       = aws_s3_bucket.terraform_state.bucket
}
