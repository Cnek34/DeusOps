FROM alpine:3.19 AS builder
RUN apk add --no-cache nodejs npm

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .
RUN npm run build

FROM nginx:1.29-alpine AS production

COPY --from=builder /app/dist /usr/share/nginx/html

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
RUN mkdir -p /var/lib/nginx/tmp /var/log/nginx /run/nginx && \
    chown -R appuser:appgroup \
    /usr/share/nginx \
    /etc/nginx \
    /var/lib/nginx \
    /var/log/nginx \
    /run/nginx && \
    rm -rf /var/cache/apk/*

USER appuser

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
