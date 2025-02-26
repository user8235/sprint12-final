FROM golang:1.23 AS builder

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN go build -o sprint12-final .

FROM alpine:latest

WORKDIR /root/
COPY --from=builder /app/sprint12-final .

ENTRYPOINT ["./sprint12-final"]