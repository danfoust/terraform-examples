BACKEND_CONFIG = "./envs/$(env)/backend.config"
VAR_FILE = "./envs/$(env)/terraform.tfvars"

#======================================================================

# Must pass env: `make init env=dev`

init:
	terraform init -backend-config=$(BACKEND_CONFIG)

plan:
	terraform plan -var-file=$(VAR_FILE)

apply:
	terraform plan -var-file=$(VAR_FILE)

destroy:
	terraform destroy -var-file$(VAR_FILE)
