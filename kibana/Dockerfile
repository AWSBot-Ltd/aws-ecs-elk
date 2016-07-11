FROM kibana:4.5.2
MAINTAINER David Reay <david@dcrbsltd.com>

RUN apt-get update && apt-get install -y netcat

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

RUN kibana plugin --install elastic/sense

CMD ["/entrypoint.sh"]
