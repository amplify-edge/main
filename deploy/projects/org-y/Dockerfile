#FROM docker.io/library/golang:1.15-alpine as app_builder
#ENV CGO_ENABLED 0
#ARG VCS_REF
#RUN mkdir -p /build
#COPY ../ /build
#WORKDIR /build
#RUN cd /build/org-y && make all

# BUILD DOCKER / PODMAN IMAGE
FROM docker.io/library/alpine:3.12
ARG BUILD_DATE
ARG GIT_REF
ARG BIN_NAME
ARG EXPOSED_PORT
ARG IMAGE_AUTHOR
ARG IMAGE_ORG
RUN apk add --no-cache ca-certificates openssl
RUN mkdir -p /usr/local/share/ca-certificates
RUN mkdir -p /app
WORKDIR /app
COPY ./bin-all/${BIN_NAME} /app/${BIN_NAME}
EXPOSE EXPOSED_PORT
CMD /app/${BIN_NAME}

LABEL org.opencontainers.image.created="${BUILD_DATE}" \
    org.opencontainers.image.title="${PACKAGE_NAME}" \
    org.opencontainers.image.authors="${IMAGE_AUTHOR}" \
    org.opencontainers.image.revision="${VCS_REF}" \
    org.opencontainers.image.vendor="${IMAGE_ORG}"