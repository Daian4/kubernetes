FROM golang:1.24-alpine AS builder
WORKDIR /app
COPY . .
RUN go mod tidy
RUN go build -o server .

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/server .
CMD ["./server"]