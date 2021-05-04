AWS_PROFILE        := tetsuzawa_el
AWS_DEFAULT_REGION := ap-northeast-1
TERRAFORM_VERSION := 0.14.9
TFSTATE_BUCKET := hands-on-terraform-state
TFSTATE_KEY = terraform.tfstate

.PHONY: all plan apply init
all:
	@more Makefile

init:
	docker-compose run --rm terraform init \
		-get=true \
		-get-plugins=true \
		-backend=true \
		-backend-config="region=$(AWS_DEFAULT_REGION)" \
		-backend-config="profile=$(AWS_PROFILE)" \
		-backend-config="bucket=$(TFSTATE_BUCKET)" \
		-backend-config="key=$(TFSTATE_KEY)"

plan: init
	docker-compose run --rm terraform plan -parallelism=1000

apply: init
	docker-compose run --rm terraform apply -auto-approve=false -parallelism=1000

destroy: init
	docker-compose run --rm terraform destroy -auto-approve=false -parallelism=1000

fmt:
	docker-compose run --rm terraform fmt
