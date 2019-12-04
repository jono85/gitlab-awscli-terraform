FROM docker:latest

RUN apk update && apk --no-cache add bash curl bc sed jq zip python3 util-linux git
RUN pip3 install awscli

RUN wget https://releases.hashicorp.com/terraform/0.12.17/terraform_0.12.17_linux_amd64.zip
RUN unzip terraform_0.12.17_linux_amd64.zip -d /usr/bin/
RUN rm -rf terraform_0.12.17_linux_amd64.zip

RUN wget https://github.com/aiven/terraform-provider-aiven/releases/download/v1.0.17/terraform-provider-aiven-darwin_amd64
RUN mv terraform-provider-aiven-darwin_amd64 /usr/bin/terraform-provider-aiven

ENTRYPOINT /bin/bash
