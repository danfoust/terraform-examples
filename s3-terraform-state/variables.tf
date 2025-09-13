variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "AWS Region (default: us-east-1)"
}

variable "env" {
  type        = string
  description = "The environment variable. Possible values: 'dev', 'prod'"

  validation {
    condition     = contains(["dev", "prod"], var.env)
    error_message = "Allowed values for env are 'dev', 'prod'"
  }
}
