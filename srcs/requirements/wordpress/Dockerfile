FROM alpine:3.18

# Instalar PHP-FPM, extensiones necesarias, wget, y WP-CLI
RUN apk update && apk add --no-cache \
    php81 \
    php81-fpm \
    php81-mysqli \
    php81-curl \
    php81-json \
    php81-mbstring \
    php81-opcache \
    php81-gd \
    php81-xml \
    php81-zlib \
    php81-phar \
    php81-intl \
    php81-dom \
    php81-session \
    php81-tokenizer \
    php81-pecl-imagick \
    wget \
    curl \
    mariadb-client \
    sudo

# Crear usuario www
RUN adduser -D -g 'www' www

# Descargar WP-CLI y hacerlo ejecutable
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

# Crear carpeta de instalación
RUN mkdir -p /var/www/html
WORKDIR /var/www/html

# Copiar script de instalación
COPY tools/setup.sh /setup.sh
RUN chmod +x /setup.sh

# Exponer el puerto del php-fpm
EXPOSE 9000

# Ejecutar script de instalación y luego iniciar php-fpm
CMD ["/bin/sh", "-c", "/setup.sh && php-fpm81 -F"]
