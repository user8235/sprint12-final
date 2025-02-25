FROM golang:1.23 AS builder

WORKDIR /app

COPY . .

RUN go mod download

RUN go build -o sprint12-final .

FROM golang:1.23

COPY --from=builder /app/sprint12-final /sprint12-final

ENTRYPOINT ["/sprint12-final"]