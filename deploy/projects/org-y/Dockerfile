# BUILD DOCKER / PODMAN IMAGE
FROM docker.io/library/golang:1.15.6-alpine as app-builder
#ARG IMAGE_DATE
#ARG IMAGE_REF
#ARG IMAGE_EXECUTABLE
#ARG IMAGE_EXPOSED_PORT
#ARG IMAGE_AUTHOR
#ARG IMAGE_ORG
RUN apk add --no-cache ca-certificates openssl make git
RUN mkdir -p /usr/local/share/ca-certificates
RUN mkdir -p /app
WORKDIR /app
COPY ./bin-all/maintemplatev2 /app/maintemplatev2
COPY ./config /app/config
COPY ./certs /app/certs
COPY ./bootstrap-data /app/bootstrap-data
EXPOSE 9074
RUN ls /app
CMD cd /app && ./maintemplatev2

#LABEL org.opencontainers.image.created="${IMAGE_DATE}" \
#    org.opencontainers.image.title="${IMAGE_NAME}" \
#    org.opencontainers.image.authors="${IMAGE_AUTHOR}" \
#    org.opencontainers.image.revision="${IMAGE_REF}" \
#    org.opencontainers.image.vendor="${IMAGE_ORG}"