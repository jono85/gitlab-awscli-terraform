FROM docker:latest

RUN apk update && apk --no-cache add bash curl bc sed jq zip python3 py3-pip util-linux git
RUN pip3 install awscli

ARG TF_VERSION="0.14.8"

RUN export TF_URL="https://releases.hashicorp.com/terraform/$TF_VERSION/terraform_"$TF_VERSION"_linux_amd64.zip" && wget $TF_URL
RUN TF_ZIP="terraform_"$TF_VERSION"_linux_amd64.zip" && mv $TF_ZIP terraform.zip
RUN unzip terraform.zip -d /usr/bin/
RUN rm -rf "terraform.zip"

COPY .bashrc /root/

ENTRYPOINT /bin/bash
