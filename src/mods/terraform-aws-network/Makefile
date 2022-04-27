TERRAFORM_IMAGE := "acactown/terraform:1.1.3-alpine-3.15.0"
WD := "/tmp"
PLAN_OUT := "plan.out"
PLAN_JSON := "plan.out.json"
TERRASCAN_CUSTOM_POLICIES_PATH := "/root/.terrascan/pkg/policies/opa/rego/aws/aws_custom/"

.SHELLFLAGS = -c # Run commands in a -c flag
.SILENT: ; # no need for @
.ONESHELL: ; # recipes execute in same shell
.PHONY: init fmt check-fmt docs check-docs graph check-editorconfig validate tflint tfsec terrascan plan checkov checkov-custom checkov-ui terraform-compliance unit contract check clean


default: check
all: init clean

init:
	docker run --rm \
		--name "${@}" \
		--volume "${PWD}":"${WD}" \
		--workdir="${WD}" \
		"${TERRAFORM_IMAGE}" sh -c 'terraform init'


fmt:
	docker run --rm \
		--name "${@}" \
		--volume "${PWD}":"${WD}" \
		--workdir="${WD}" \
		"${TERRAFORM_IMAGE}" sh -c 'terraform fmt -recursive'


check-fmt:
	docker run --rm \
		--name "${@}" \
		--volume "${PWD}":"${WD}" \
		--workdir="${WD}" \
		"${TERRAFORM_IMAGE}" sh -c 'terraform fmt -check=true -diff=true -write=false -recursive'


docs: init
	docker run --rm \
		--name "${@}" \
		--volume "${PWD}":"${WD}" \
		--workdir="${WD}" \
		"${TERRAFORM_IMAGE}" sh -c 'terraform-docs .'


check-docs: init
	test -s ./docs/diagram.png || exit 1
	test -s ./docs/diagram.drawio.xml || exit 1
	docker run --rm \
		--name "${@}" \
		--volume "${PWD}":"${WD}" \
		--workdir="${WD}" \
		"${TERRAFORM_IMAGE}" sh -c 'terraform-docs --output-file ~/README.md.expected . && diff -c README.md ~/README.md.expected'


graph: init
	docker run --rm \
		--name "${@}" \
		--volume "${PWD}":"${WD}" \
		--workdir="${WD}" \
		"${TERRAFORM_IMAGE}" sh -c 'terraform graph | terraform-graph-beautifier --output-type=cyto-html --embed-modules=true > docs/graph.html'


check-editorconfig:
	docker run --rm \
		--name "${@}" \
		--volume "${PWD}":"${WD}" \
		--workdir="${WD}" \
		"${TERRAFORM_IMAGE}" sh -c 'ec'


validate: init
	docker run --rm \
		--name "${@}" \
		--volume "${PWD}":"${WD}" \
		--workdir="${WD}" \
		"${TERRAFORM_IMAGE}" sh -c 'terraform validate'


tflint: init
	docker run --rm \
		--name "${@}" \
		--volume "${PWD}":"${WD}" \
		--workdir="${WD}" \
		"${TERRAFORM_IMAGE}" sh -c 'tflint --init && tflint'


tfsec: clean
	docker run --rm \
		--name "${@}" \
		--volume "${PWD}":"${WD}" \
		--workdir="${WD}" \
		"${TERRAFORM_IMAGE}" sh -c 'tfsec --tfvars-file terraform.example.tfvars .'


terrascan: clean
	docker run --rm \
		--name "${@}" \
		--volume "${PWD}":"${WD}" \
		--workdir="${WD}" \
		"${TERRAFORM_IMAGE}" sh -c 'terrascan init && mkdir -p "${TERRASCAN_CUSTOM_POLICIES_PATH}" && cp ./test/policies/* "${TERRASCAN_CUSTOM_POLICIES_PATH}" && chmod -R +x "${TERRASCAN_CUSTOM_POLICIES_PATH}" && terrascan scan --config-path terrascan_config.toml --iac-type terraform --policy-type aws --non-recursive'


plan: init
	export SEED=$(date +%s%3N)
	docker run --rm \
		--name "${@}" \
		--volume "${PWD}":"${WD}" \
		--workdir="${WD}" \
		--env AWS_REGION="${AWS_REGION}" \
		--env AWS_DEFAULT_REGION="${AWS_DEFAULT_REGION}" \
		--env AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID}" \
		--env AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY}" \
		--env AWS_SESSION_TOKEN="${AWS_SESSION_TOKEN}" \
		--env AWS_SECURITY_TOKEN="${AWS_SECURITY_TOKEN}" \
		"${TERRAFORM_IMAGE}" sh -c 'terraform plan -var-file="terraform.example.tfvars" -var "prefix=${SEED}-test" -out="${PLAN_OUT}" && terraform show -json "${PLAN_OUT}" > "${PLAN_JSON}"'


checkov: plan
	docker run --rm \
		--name "${@}" \
		--volume "${PWD}/${PLAN_JSON}":"${WD}/${PLAN_JSON}" \
		--workdir="${WD}" \
		bridgecrew/checkov --framework terraform_plan --file "${PLAN_JSON}" --output cli


checkov-custom: plan
	docker run --rm \
		--name "${@}" \
		--volume "${PWD}/${PLAN_JSON}":"${WD}/${PLAN_JSON}" \
		--workdir="${WD}" \
		bridgecrew/checkov --framework terraform_plan --file "${PLAN_JSON}" --external-checks-git 'https://github.com/schosterbarak/example-shared-checkov-policies.git' --output cli


checkov-ui: clean
	docker run --rm \
		--name "${@}" \
		--volume "${PWD}":"${WD}" \
		--workdir="${WD}" \
		--env BC_API_URL="https://www.bridgecrew.cloud" \
		bridgecrew/checkov --framework terraform --directory "${WD}" --bc-api-key "${BC_API_KEY}" --repo-id acactown/terraform-tdd


terraform-compliance: plan
	docker run --rm \
		--name "${@}" \
		--volume "${PWD}":"${WD}" \
		--workdir="${WD}" \
		"${TERRAFORM_IMAGE}" sh -c 'terraform-compliance --planfile "${PLAN_JSON}" --features ./test/compliance/'


unit: clean
	docker run --rm \
		--name "${@}" \
		--volume "${PWD}":"${WD}" \
		--workdir="${WD}" \
		"${TERRAFORM_IMAGE}" sh -c '\
			conftest test --policy test/unit/locals.rego locals.tf && \
			conftest test --policy test/unit/vpc.rego vpc.tf && \
			conftest test --policy test/unit/subnet.rego subnet.tf'


contract:
	docker run --rm \
		--name "${@}" \
		--volume "${PWD}":"${WD}" \
		--workdir="${WD}" \
		"${TERRAFORM_IMAGE}" sh -c '\
			conftest test --policy test/contract/variables.rego "${PLAN_JSON}" && \
			conftest test --policy test/contract/outputs.rego "${PLAN_JSON}" && \
			conftest test --policy test/contract/logic.rego "${PLAN_JSON}"'


check: check-editorconfig check-fmt check-docs validate tflint tfsec terrascan checkov terraform-compliance unit contract


clean:
	docker run --rm \
		--name "${@}" \
		--volume "${PWD}":"${WD}" \
		--workdir="${WD}" \
		"${TERRAFORM_IMAGE}" sh -c 'rm -rf .terraform .tfsec terraform-compliance* && rm -f .terraform.lock.hcl "${PLAN_OUT}" "${PLAN_JSON}" .lark_cache* update_checker*.pkl'
