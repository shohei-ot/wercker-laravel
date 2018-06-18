FROM debian:stretch-slim
MAINTAINER shoheiot <shohei.ot@gmail.com>

COPY scripts /tmp/
RUN bash /tmp/provision.sh

CMD ["sudo", "-u", "postgres", "/etc/init.d/postgresql", "start"]