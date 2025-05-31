FROM scratch
COPY go-auto-release-poc /
ENTRYPOINT ["/go-auto-release-poc"]
