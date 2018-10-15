FROM golang:latest

MAINTAINER <panther93@protonmail.com>

EXPOSE 8006 

EXPOSE 8000

RUN apt-get update
RUN apt-get install -y wget
RUN wget https://github.com/stellar/bridge-server/releases/download/v0.0.31/bridge-v0.0.31-linux-amd64.tar.gz
RUN tar -zvxf bridge-v0.0.31-linux-amd64.tar.gz
RUN cp bridge-v0.0.31-linux-amd64/bridge /usr/local/bin/bridge
RUN chmod +x /usr/local/bin/bridge
RUN rm -rf bridge-v0.0.31-linux-amd64.tar.gz
RUN mkdir -p /opt/stellar/bridge

VOLUME ["/opt/stellar/bridge"] 

WORKDIR /opt/stellar/

ADD start.sh .
RUN ["chmod", "+x", "start.sh"]
ENTRYPOINT ./start.sh

