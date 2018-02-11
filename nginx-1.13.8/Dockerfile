FROM nginx:1.13.8

RUN apt-get update \
  && apt-get install -y letsencrypt \
  && supervisor \
  && cron \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && mkdir -p /etc/letsencrypt \
  && mkdir -p /var/www/letsencrypt

COPY supervisord.conf /etc/supervisord.conf

VOLUME ["/etc/cron.d", "/var/www/letsencrypt", "/etc/letsencrypt"]

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
