# Penultima imagen actual de debian "bullseye"
FROM debian:bullseye

# Actualizar los paquetes e instala nginx y openssl
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl && \
    chmod 666 /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/ssl.key \
    -out /etc/nginx/ssl/ssl.crt \
    -subj "/C=ES/ST=Madrid/L=Madrid/O=42/CN=$DOMAIN_NAME"

COPY conf/nginx.conf /etc/nginx/nginx.conf

# Exponer el puerto 443
EXPOSE 443

# Lanzar nginx
CMD [ "nginx", "-g", "daemon off;" ]

