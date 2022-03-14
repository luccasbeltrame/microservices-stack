init:
	cd ./terraform/aws/ && terraform init

plan:
	cd ./terraform/aws/ && terraform plan

apply:
	cd ./terraform/aws/ && terraform apply --auto-approve	
