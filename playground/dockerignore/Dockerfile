FROM alpine

RUN apk update && apk add tree

COPY . /app
WORKDIR /app

CMD ["/usr/bin/tree"]
