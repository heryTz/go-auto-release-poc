ARG APP_NAME=go-auto-release-poc

FROM golang:1.24-alpine AS builder
WORKDIR /app
COPY /app/go.mod ./
RUN go mod download
COPY . .
RUN go build

FROM alpine:latest AS prod
ARG APP_NAME
WORKDIR /app
COPY --from=builder /app/go-auto-release-poc /app/go-auto-release-poc
ENTRYPOINT ["/app/go-auto-release-poc"]
