# Этап сборки
FROM golang:1.23 AS builder

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .
# Статическая компиляция
RUN CGO_ENABLED=0 GOOS=linux go build -o sprint12-final .

# Финальный этап
FROM alpine:latest

WORKDIR /root/
COPY --from=builder /app/sprint12-final .

# Проверка, что файл существует
RUN ls -la /root/sprint12-final

ENTRYPOINT ["./sprint12-final"]