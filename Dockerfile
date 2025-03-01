FROM alpine:latest

RUN apk add --no-cache nginx && \
    mkdir -p /run/nginx && \
    chown -R nginx:nginx /var/lib/nginx

RUN adduser -S -D -H -s /sbin/nologin nginx || true

COPY nginx/nginx.conf /etc/nginx/nginx.conf

COPY nginx/index.html /usr/share/nginx/html/index.html

USER nginx

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
