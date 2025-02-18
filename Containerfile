FROM php:cli

WORKDIR /app

RUN apt-get update && \
    apt-get install -y --no-install-recommends libonig-dev xclip xsel wl-clipboard xauth && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install mbstring

COPY ./h-m-m /usr/bin/.

RUN chmod +x /usr/bin/h-m-m

ENTRYPOINT ["/usr/bin/h-m-m"]
