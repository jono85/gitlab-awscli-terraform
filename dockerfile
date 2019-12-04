FROM golang:alpine

RUN apk update && apk add bash curl bc sed jq zip python3 util-linux git go
RUN pip3 install awscli

WORKDIR $GOPATH
RUN go get -u github.com/aiven/terraform-provider-aiven

ENTRYPOINT /bin/bash
