FROM golang:1.20-alpine as builder
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
CMD ["sh","-c","/share --debug --min-per-gig 120 --max-file 500000000 --data /data --public ${url}"]
