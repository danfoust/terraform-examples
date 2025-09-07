# You cannot create the S3 bucket that stores the terraform state in the same repo.
terraform {
  # You can set the keys of the backend ``terraform init -backend-config="envs/dev/backend.config"`
  backend "s3" {
    bucket  = ""
    key     = "terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
    # Best practice is to use s3 lockfile, dynamodb table is deprecated
    use_lockfile = true
  }
}
