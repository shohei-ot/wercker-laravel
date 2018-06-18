FROM debian:stretch-slim
MAINTAINER shoheiot <shohei.ot@gmail.com>

COPY scripts/provision.sh /tmp/
RUN bash /tmp/provision.sh

COPY scripts/install_node_sass.sh /tmp/
RUN bash /tmp/install_node_sass.sh

CMD ["sudo", "-u", "postgres", "/etc/init.d/postgresql", "start"]