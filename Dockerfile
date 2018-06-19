FROM golang:latest

MAINTAINER <panther93@protonmail.com>

EXPOSE 8006 

EXPOSE 8000

RUN apt-get update
RUN mkdir -p /opt/stellar/bridge
RUN apt-get install -y wget
RUN wget https://github.com/stellar/bridge-server/releases/download/v0.0.30/bridge-v0.0.30-linux-amd64.tar.gz
RUN tar -zvxf bridge-v0.0.30-linux-amd64.tar.gz
RUN cp bridge-v0.0.30-linux-amd64/bridge /usr/local/bin/bridge

VOLUME ["/opt/stellar/bridge"] 

#bridge --migrate-db before running stellar-bridge container!!
CMD ["/usr/local/bin/bridge","-c=/opt/stellar/bridge/etc/bridge.cfg"]