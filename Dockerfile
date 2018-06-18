FROM debian:stretch-slim
MAINTAINER shoheiot <shohei.ot@gmail.com>

COPY scripts/provision.sh /tmp/
RUN bash /tmp/provision.sh

COPY scripts/install_tools.sh /tmp/
RUN bash /tmp/install_tools.sh

CMD ["sudo", "-u", "postgres", "/etc/init.d/postgresql", "start"]