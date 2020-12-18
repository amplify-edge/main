# BUILD DOCKER / PODMAN IMAGE
#FROM cirrusci/flutter:beta as app-builder
#RUN apt update && \
#    add-apt-repository ppa:longsleep/golang-backports
#RUN apt install -y ca-certificates build-essential git golang-go libnss3-tools
#RUN mkdir -p /usr/local/share/ca-certificates
#WORKDIR /go/src/app
#COPY . .
#RUN cd /go/src/app && make all
#RUN ls -alh /go/src/app

FROM alpine:latest
RUN mkdir -p /app/db
WORKDIR /app
#COPY --from=app-builder /go/src/app/bin-all/$IMAGE_EXECUTABLE /app/$IMAGE_EXECUTABLE
#COPY --from=app-builder /go/src/app/bootstrap-data /app/bootstrap-data
COPY config /app/config
COPY certs  /app/certs
COPY bin-all/maintemplatev2 /app/maintemplatev2
ENV PORT=8080
EXPOSE 8080
RUN chmod +x /app/maintemplatev2
RUN ls -alh /app
CMD ["./maintemplatev2"]

LABEL org.opencontainers.image.created="${IMAGE_DATE}" \
    org.opencontainers.image.title="${IMAGE_NAME}" \
    org.opencontainers.image.authors="${IMAGE_AUTHOR}" \
    org.opencontainers.image.revision="${IMAGE_REF}" \
    org.opencontainers.image.vendor="${IMAGE_ORG}"