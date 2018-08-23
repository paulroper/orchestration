FROM golang:1.10.3 as build

WORKDIR /var/code

ENV GOPATH /var/code
ENV PATH $PATH:/var/code/bin

RUN mkdir -p /var/code/bin
RUN curl https://glide.sh/get | sh

ADD . .

RUN cd src && glide install
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o ./bin/go-http ./src

FROM alpine:latest

WORKDIR /var/bin
ENV PORT 3000

RUN apk --no-cache add ca-certificates
COPY --from=build /var/code/bin/go-http .

CMD ./go-http
