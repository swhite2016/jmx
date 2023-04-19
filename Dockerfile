############################################################################
# This dockerfile will setup a centos container with OpenJDK installed on it
############################################################################
FROM node:alpine

MAINTAINER Susie White  <susie.white@salesforce.com>

ADD imq.tar /opt/imq.tar
RUN dnf -y install java java-11-openjdk

COPY imqenv.conf /opt/imq.tar/imq/etc
RUN export JAVA_HOME=/usr/lib/jvm/java-openjdk
RUN export PATH=$JAVA_HOME:$PATH

EXPOSE 8998 1099

VOLUME /var/imq
VOLUME /opt/imq.tar/imq/etc

ENTRYPOINT ["/opt/imq.tar/imq/bin/imqbrokerd", "-vmargs", "-d64", "-port", "8998"]
