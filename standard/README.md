# Quick start

- Fill out `envs/<env>` files
  - Need to set terraform state bucket
  - Need to fillout any custom `terrform.tfvars`

```bash
# Initialize
make init env=dev

# Review plan
make plan env=dev

# Apply plan
make apply env=dev
```

# Standard Repository Structure

Every root-level terraform module should have a README.

- `examples/`- Examples should go here
- `files/` - Static files should here
- `templates/` - Terraform `templatefile` function files should go here
- `modules/` - Nested modules should go here
- `envs/` - Environment specific `.tfvars` and `backend.config` go here

- It's best-practice to avoid creating `.tf` files per service and instead you should include all `resource` blocks inside `main.tf`. An exception can be made if a resource starts to exceed 150 lines, eg. with defining iam policies.

- If you need to heavily configure a resources/constructs in a nested module, it then makes sense to extract it to its own git repository to keep modules flat and modular.

- Don't wrap single resources. If you just wrap single service, it makes sense to just include it in the root `main.tf`.

- Do encapsulate logical relationships. Groups of related resources such as networking foundations, data tiers, security controls, and applications.

# Naming Conventions

- Use `snake_case`
- Add units to names of inputs, local variables, and outputs. Eg. `ram_size_gb`
- Use binary units (MiB, GiB) for storage, and decimal units (MB, GB) for everything else
- Give boolean variables positive names such as `enable_access`.

# Use attachment resources

Avoid embedded attributes:

```tf
resource "aws_security_group" "allow_tls" {
  ingress {
    description = "TLS from VPC"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
    ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }
}
```

Prefer attachment resources:

```tf
resource "aws_security_group" "allow_tls" {
  #...
}

resource "aws_security_group_rule" "example" {
  type = "ingress"
  description = "TLS from VPC"
  from_port = 443
  to_port = 443
  protocol = "tcp"
  cidr_blocks = [aws_vpc.main.cidr_block]
  ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  security_group_id = aws_security_group.allow_tls.id
}
```

# Modules

- Pin commit hashes to avoid drift from public registries that are vulnerable to supply chain attacks.

```tf
module "lambda" {
  #--> v4.18.0
  source = "github.com/terraform-aws-modules/terraform-aws-lambda.git?ref=e78cdf1f82944897ca6e30d6489f43cf24539374"
}
```

# Defining tags

```tf
locals {
  common_tags = {
    Project = "FooBar"
    Environment = var.env
    # ...
  }
}

resource "aws_sns_topic" "sns_topic" {
  # ...

  tags = merge(
    local.common_tags,
    {
      "Name" = var.sns_topic_name
    }
  )
}
```

# References

- [AWS Prescriptive Guidance - Best practices for using terraform aws provider](https://docs.aws.amazon.com/pdfs/prescriptive-guidance/latest/terraform-aws-provider-best-practices/terraform-aws-provider-best-practices.pdf)
