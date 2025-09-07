locals {
  aws = {
    # This is unlikely to change, so I've made it a local instead of a variable.
    # If that changes, it's easy enough to assign the variable here without needing to
    # update references throughout the repo.
    region = "us-east-1"
  }

  # Define the common tags for all resources
  common_tags = {
    # Human-readable resource name
    Name = ""
    # The ID for the application that uses the resource
    AppId = ""
    # The resource's technical function; for example, "webserver" or "database"
    AppRole = ""
    # The resource's business purpose; for example, "frontend ui" or "payment processor"
    AppPurpose = ""
    # The software environment, such as dev, test, or prod
    Environment = var.env
    # The projects that use the resource
    Project = ""
    # Who to bill for resource usage
    CostCenter = ""
  }
}
