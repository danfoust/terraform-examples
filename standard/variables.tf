variable "env" {
  type        = string
  description = "The target environment. Accepted values: 'dev', 'prod'"

  validation {
    condition     = contains(["dev", "prod"], var.env)
    error_message = "Allowed values for env are 'dev', 'prod'"
  }
}
