resource "aws_s3_bucket" "terraform_state" {
  bucket        = "mytotallyuniquename123-${var.env}-terraform-state"
  region        = var.aws_region
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "terraform_state_versioning" {
  bucket = aws_s3_bucket.terraform_state.bucket
  region = var.aws_region

  versioning_configuration {
    status = "Enabled"
  }
}
