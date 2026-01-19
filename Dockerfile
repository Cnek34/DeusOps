FROM alpine

RUN apk add --no-cache nginx

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

RUN mkdir -p /var/lib/nginx/tmp /var/log/nginx /run/nginx && \
    chown -R appuser:appgroup \
    /usr/share/nginx \
    /etc/nginx \
    /var/lib/nginx \
    /var/log/nginx \
    /run/nginx

USER appuser

EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
