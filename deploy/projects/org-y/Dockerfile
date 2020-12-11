# BUILD DOCKER / PODMAN IMAGE
#FROM docker.io/library/golang:1.15.6-alpine as app-builder
FROM cirrusci/flutter:beta
RUN apt update && \
    add-apt-repository ppa:longsleep/golang-backports
RUN apt install -y ca-certificates build-essential git golang-go libnss3-tools
RUN go get -u -v github.com/go-bindata/go-bindata/...
RUN curl -L -o /usr/local/bin/jb https://github.com/jsonnet-bundler/jsonnet-bundler/releases/download/v0.4.0/jb-linux-amd64 && \
    chmod +x /usr/local/bin/jb
RUN curl -L -o /tmp/go-jsonnet.deb https://github.com/google/go-jsonnet/releases/download/v0.17.0/jsonnet-go_0.17.0_linux_amd64.deb && \
    apt install -y /tmp/go-jsonnet.deb
RUN curl -L -o /tmp/go-bindata.tar.gz https://github.com/go-bindata/go-bindata/archive/v3.1.3.tar.gz && \
    cd /tmp && tar -zxvf /tmp/go-bindata.tar.gz && \
    cd /tmp/go-bindata-3.1.3/go-bindata && go build && install -Dm755 go-bindata /usr/local/bin/go-bindata
RUN git clone https://github.com/FiloSottile/mkcert /tmp/mkcert && cd /tmp/mkcert && \
    go build -ldflags "-X main.Version=$(git describe --tags)" && install -Dm755 mkcert /usr/local/bin/mkcert
RUN git clone https://github.com/getcouragenow/shared /tmp/shared && \
    cd /tmp/shared/tool/bs-lang && go build && install -Dm755 bs-lang /usr/local/bin/bs-lang
RUN mkdir -p /usr/local/share/ca-certificates
RUN mkdir -p /app
WORKDIR /app
COPY . /app
RUN cd /app && make all
#COPY ./bin-all/maintemplatev2 /app/maintemplatev2
#COPY ./config /app/config
#COPY ./certs /app/certs
#COPY ./bootstrap-data /app/bootstrap-data
EXPOSE 9074
RUN ls /app
CMD cd /app && ./maintemplatev2

#LABEL org.opencontainers.image.created="${IMAGE_DATE}" \
#    org.opencontainers.image.title="${IMAGE_NAME}" \
#    org.opencontainers.image.authors="${IMAGE_AUTHOR}" \
#    org.opencontainers.image.revision="${IMAGE_REF}" \
#    org.opencontainers.image.vendor="${IMAGE_ORG}"