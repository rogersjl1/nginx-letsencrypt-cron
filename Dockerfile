FROM nginx:1.13.8

RUN apt-get update \
  && apt-get install -y letsencrypt \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get install -y --no-install-recommends cron

COPY supervisord.conf /etc/supervisord.conf

VOLUME ["/etc/cron.d", "/var/www/letsencrypt", "/etc/letsencrypt"]

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
