############################################################################
# This dockerfile will setup a centos container with OpenJDK installed on it
############################################################################

FROM node:alpine

MAINTAINER Susie White  <susie.white@salesforce.com>

ADD imq.tar /opt/imq.tar

COPY imqenv.conf /opt/imq.tar/imq/etc

EXPOSE 8998 1099

VOLUME /usr/local/opt/openjdk/libexec/openjdk.jdk/Contents/Home/bin:/var/bin
VOLUME /var/imq
VOLUME /opt/imq.tar/imq/etc

ENTRYPOINT ["/opt/imq.tar/imq/bin/imqbrokerd", "-vmargs", "-d64", "-port", "8998"]
