FROM httpd:2.4

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    curl \
    jq \
    && rm -r /var/lib/apt/lists/*

COPY ./public-html/ /usr/local/apache2/htdocs/

CMD ["httpd-foreground"]