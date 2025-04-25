FROM debian:bullseye

ARG DOMAIN_NAME

RUN apt-get update && \
    apt-get install -y nginx openssl gettext-base && \
    apt-get clean

RUN mkdir -p /etc/nginx/ssl /var/www/html /run/nginx

RUN openssl req -x509 -nodes -days 365 \
    -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/ssl.key \
    -out /etc/nginx/ssl/ssl.crt \
    -subj "/C=ES/ST=Madrid/L=Madrid/O=42/CN=${DOMAIN_NAME}"

COPY conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
