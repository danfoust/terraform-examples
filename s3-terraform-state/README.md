# Overview

This is a minimal example for how you can setup an S3 bucket to store terraform state for your various terraform projects.

# Usage

Run `make init` to initial terraform.

```shell
make init
```

Run `make plan` to review changes.

```shell
make plan env=dev
```

Run `make apply` to execute changes.

```shell
make apply env=dev
```

When done, you can destroy your resources with `make destroy`.

```shell
make destroy env=dev
```
