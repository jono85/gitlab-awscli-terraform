FROM docker:latest

RUN apk update && apk add bash curl bc sed jq zip python3 util-linux
RUN pip3 install awscli
RUN wget https://releases.hashicorp.com/terraform/0.12.16/terraform_0.12.16_linux_amd64.zip
RUN unzip terraform_0.12.16_linux_amd64.zip -d /usr/bin/
RUN rm -rf terraform_0.12.16_linux_amd64.zip

ENTRYPOINT /bin/bash
