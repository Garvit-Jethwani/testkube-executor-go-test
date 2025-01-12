# syntax=docker/dockerfile:1
FROM golang:1.18
WORKDIR /build
COPY . .
ENV CGO_ENABLED=0 
ENV GOOS=linux

RUN cd cmd/agent;go build -o /runner -mod mod -a .

FROM alpine
RUN apk --no-cache add ca-certificates git go 
WORKDIR /root/
COPY --from=0 /runner /bin/runner
# COPY go /usr/local/bin/go
ENTRYPOINT ["/bin/runner"]