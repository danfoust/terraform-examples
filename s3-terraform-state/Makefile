VAR_FILE = "./environments/$(env)/vars.tfvars"

#======================================================

init:
	terraform init -input=false

plan:
	terraform plan -var-file=$(VAR_FILE)

apply:
	terraform apply -var-file=$(VAR_FILE)

destroy:
	terraform destroy -var-file=$(VAR_FILE)
