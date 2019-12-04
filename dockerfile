FROM docker:latest

RUN apk update && apk add bash curl bc sed jq zip python3 util-linux git go
RUN pip3 install awscli
RUN go get -u github.com/hashicorp/terraform
RUN go get -u github.com/aiven/terraform-provider-aiven
RUN export PATH=$PATH:~/go/bin

ENTRYPOINT /bin/bash
