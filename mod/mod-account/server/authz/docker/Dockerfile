FROM golang:1.13-alpine AS builder
RUN apk --no-cache add git

WORKDIR /packages
COPY . .
RUN cd /packages/mod-account/server/authz && go build -o authz cmd/authorization

FROM alpine:latest
EXPOSE 9075:tcp

WORKDIR /root/
COPY --from=builder /packages/mod-account/server/authz /root/
ENTRYPOINT["/root/authz"]