FROM docker:latest

RUN apk update && apk --no-cache add bash curl bc sed jq zip python3 py3-pip util-linux git

#need to remove EXTERNALLY-MANAGED file or boto3 install will fail
RUN rm -rf /usr/lib/python*/EXTERNALLY-MANAGED

#install boto3 and awscli
RUN pip3 install boto3 awscli

#install terraform v0.14.8
ARG TF_VERSION="0.14.8"
RUN export TF_URL="https://releases.hashicorp.com/terraform/$TF_VERSION/terraform_"$TF_VERSION"_linux_amd64.zip" && wget $TF_URL
RUN TF_ZIP="terraform_"$TF_VERSION"_linux_amd64.zip" && mv $TF_ZIP terraform.zip
RUN unzip terraform.zip -d /usr/bin/
RUN rm -rf "terraform.zip"

COPY .bashrc /root/

ENTRYPOINT /bin/bash
