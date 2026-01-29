FROM alpine:3.19

RUN apk add --no-cache nodejs npm python3 make g++

WORKDIR /app