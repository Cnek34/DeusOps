FROM alpine:3.21

RUN apk add --no-cache nginx && \
    mkdir -p /run/nginx && \
    mkdir -p /var/log/nginx && \
    mkdir -p /var/lib/nginx

RUN addgroup -S nginxgroup && adduser -S nginxuser -G nginxgroup

RUN chown -R nginxuser:nginxgroup /var/lib/nginx /var/log/nginx /run/nginx

EXPOSE 80

USER nginxuser

ENTRYPOINT ["nginx", "-g", "daemon off;"]