FROM golang:1.16.3-alpine3.13 as build-reflex
RUN apk update && \
    apk add bash git && \
    rm -rf /var/cache/apk/*

RUN go get github.com/cespare/reflex

FROM golang:1.16.3-alpine3.13
COPY --from=build-reflex /go/bin/reflex /go/bin/reflex

RUN apk update && \
    apk add bash git build-base && \
    rm -rf /var/cache/apk/*

ENV GOOS=linux \
    GOARCH=amd64 \
    CGO_ENABLED=0

WORKDIR /app

COPY go.mod .
COPY go.sum .
RUN go mod download

COPY . .
