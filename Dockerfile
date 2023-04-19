############################################################################
# This dockerfile will setup a centos container with OpenJDK installed on it
############################################################################
FROM node:alpine

MAINTAINER Susie White  <susie.white@salesforce.com>

ADD imq.tar /opt/imq.tar
RUN mkdir /opt/java/bin

COPY imqenv.conf /opt/imq.tar/imq/etc
COPY jar    /opt/java/bin
COPY jarsigner    /opt/java/bin
COPY java    /opt/java/bin
COPY javac    /opt/java/bin
COPY javadoc    /opt/java/bin
COPY javap    /opt/java/bin
COPY jcmd    /opt/java/bin
COPY jconsole    /opt/java/bin
COPY jdb    /opt/java/bin
COPY jdeprscan    /opt/java/bin
COPY jdeps    /opt/java/bin
COPY jfr    /opt/java/bin
COPY jhsdb    /opt/java/bin
COPY jimage    /opt/java/bin
COPY jinfo    /opt/java/bin
COPY jlink    /opt/java/bin
COPY jmap    /opt/java/bin
COPY jmod    /opt/java/bin
COPY jpackage    /opt/java/bin
COPY jps    /opt/java/bin
COPY jrunscript    /opt/java/bin
COPY jshell    /opt/java/bin
COPY jstack    /opt/java/bin
COPY jstat    /opt/java/bin
COPY jstatd    /opt/java/bin
COPY jwebserver    /opt/java/bin
COPY keytool    /opt/java/bin
COPY rmiregistry    /opt/java/bin
COPY serialver    /opt/java/bin

EXPOSE 8998 1099

VOLUME /var/imq
VOLUME /opt/imq.tar/imq/etc

ENTRYPOINT ["/opt/imq.tar/imq/bin/imqbrokerd", "-vmargs", "-d64", "-port", "8998"]
