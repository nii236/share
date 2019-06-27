FROM golang:1.12-alpine as builder
RUN apk add --no-cache git make g++ gzip
WORKDIR /go/share
COPY . .
RUN go generate
RUN go install -v

FROM alpine:latest 
VOLUME /data
EXPOSE 8222
COPY --from=builder /go/bin/share /share
ENV url "http://localhost:8222"
CMD ["sh","-c","/share --debug --data /data --public ${url}"]
