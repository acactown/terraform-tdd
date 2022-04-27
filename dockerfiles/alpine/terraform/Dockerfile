# Arguments
# ---------
ARG BASE_IMAGE="acactown/alpine:3.15.0"

# Pull Base Image
# ----------------
FROM ${BASE_IMAGE}

# Arguments
# ---------
ARG TERRAFORM_VERSION="1.1.3"
ARG TFLINT_VERSION="0.35.0"
ARG AWS_CLI_VERSION="1.23.1"
ARG CONFTEST_VERSION="0.31.0"
ARG TERRAFORM_DOCS_VERSION="0.16.0"
ARG EDITORCONFIG_CHECKER_VERSION="2.4.0"
ARG TERRAFORM_GRAPH_BEAUTIFIER_VERSION="0.2.0"
ARG CHECKOV_VERSION="2.0.1105"
ARG TFSEC_VERSION="1.19.1"
ARG TERRAFORM_COMPLIANCE_VERSION="1.3.32"
ARG TERRASCAN_VERSION="1.14.0"

# OS ENV Variables
# ----------------
ENV TERRAFORM_PLUGINS_DIR=/root/.terraform.d/plugins \
    TERRAFORM_OSARCH=linux_amd64 \
    TF_IN_AUTOMATION=true

# Install Dependencies
# --------------------
RUN apk update \
    && apk add --no-cache --update-cache git util-linux openssl curl openssh wget build-base libffi-dev python3 python3-dev tree \
    && python3 -m ensurepip \
    && pip3 install --upgrade pip \
    && pip3 install --upgrade setuptools \
    && pip3 --no-cache-dir install --upgrade awscli==${AWS_CLI_VERSION} \
    && pip3 --no-cache-dir install --upgrade terraform-compliance==${TERRAFORM_COMPLIANCE_VERSION} \
    # && pip3 --no-cache-dir install --upgrade checkov==${CHECKOV_VERSION} \
    && mkdir -p /root/.ssh \
    && ssh-keyscan -H github.com >> /root/.ssh/known_hosts \
    && cd /tmp \
    && curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_${TERRAFORM_OSARCH}.zip > terraform_${TERRAFORM_VERSION}_${TERRAFORM_OSARCH}.zip \
    && curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_SHA256SUMS | grep linux_amd6 > terraform_${TERRAFORM_VERSION}_SHA256SUMS \
    && sha256sum -cs terraform_${TERRAFORM_VERSION}_SHA256SUMS \
    && unzip terraform_${TERRAFORM_VERSION}_${TERRAFORM_OSARCH}.zip -d /bin \
    && wget https://github.com/terraform-linters/tflint/releases/download/v${TFLINT_VERSION}/tflint_${TERRAFORM_OSARCH}.zip \
    && unzip tflint_${TERRAFORM_OSARCH}.zip -d /bin \
    && wget https://github.com/instrumenta/conftest/releases/download/v${CONFTEST_VERSION}/conftest_${CONFTEST_VERSION}_Linux_x86_64.tar.gz \
    && tar xzf conftest_${CONFTEST_VERSION}_Linux_x86_64.tar.gz \
    && mv conftest /bin \
    && wget https://github.com/terraform-docs/terraform-docs/releases/download/v${TERRAFORM_DOCS_VERSION}/terraform-docs-v${TERRAFORM_DOCS_VERSION}-linux-amd64.tar.gz \
    && tar xzf terraform-docs-v${TERRAFORM_DOCS_VERSION}-linux-amd64.tar.gz \
    && mv terraform-docs /bin \
    && wget https://github.com/editorconfig-checker/editorconfig-checker/releases/download/${EDITORCONFIG_CHECKER_VERSION}/ec-linux-amd64.tar.gz \
    && tar xzf ec-linux-amd64.tar.gz \
    && mv bin/ec-linux-amd64 /bin/ec \
    && wget https://github.com/pcasteran/terraform-graph-beautifier/releases/download/v${TERRAFORM_GRAPH_BEAUTIFIER_VERSION}/terraform-graph-beautifier_${TERRAFORM_GRAPH_BEAUTIFIER_VERSION}_Linux_x86_64.tar.gz \
    && tar xzf terraform-graph-beautifier_${TERRAFORM_GRAPH_BEAUTIFIER_VERSION}_Linux_x86_64.tar.gz \
    && mv terraform-graph-beautifier /bin \
    && wget https://github.com/aquasecurity/tfsec/releases/download/v${TFSEC_VERSION}/tfsec-linux-amd64 \
    && mv tfsec-linux-amd64 /bin/tfsec \
    && wget https://github.com/accurics/terrascan/releases/download/v${TERRASCAN_VERSION}/terrascan_${TERRASCAN_VERSION}_Linux_x86_64.tar.gz \
    && tar xzf terrascan_${TERRASCAN_VERSION}_Linux_x86_64.tar.gz \
    && mv terrascan /bin \
    && chmod +x /bin/* \
    && mkdir -p ${TERRAFORM_PLUGINS_DIR} \
    && apk del wget \
    && rm -rf /tmp/* /var/cache/apk/*
