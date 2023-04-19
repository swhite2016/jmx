############################################################################
# This dockerfile will setup a centos container with OpenJDK installed on it
############################################################################
FROM node:alpine

MAINTAINER Susie White  <susie.white@salesforce.com>

ADD imq.tar /opt/imq.tar
RUN mkdir -p  /usr/lib/jvm/java-openjdk/bin

COPY imqenv.conf /opt/imq.tar/imq/etc
COPY jar /usr/lib/jvm/java-openjdk/bin
COPY jarsigner /usr/lib/jvm/java-openjdk/bin
COPY java /usr/lib/jvm/java-openjdk/bin
COPY javac /usr/lib/jvm/java-openjdk/bin
COPY javadoc /usr/lib/jvm/java-openjdk/bin
COPY javap /usr/lib/jvm/java-openjdk/bin
COPY jcmd /usr/lib/jvm/java-openjdk/bin
COPY jconsole /usr/lib/jvm/java-openjdk/bin
COPY jdb /usr/lib/jvm/java-openjdk/bin
COPY jdeprscan /usr/lib/jvm/java-openjdk/bin
COPY jdeps /usr/lib/jvm/java-openjdk/bin
COPY jfr /usr/lib/jvm/java-openjdk/bin
COPY jhsdb /usr/lib/jvm/java-openjdk/bin
COPY jimage /usr/lib/jvm/java-openjdk/bin
COPY jinfo /usr/lib/jvm/java-openjdk/bin
COPY jlink /usr/lib/jvm/java-openjdk/bin
COPY jmap /usr/lib/jvm/java-openjdk/bin
COPY jmod /usr/lib/jvm/java-openjdk/bin
COPY jpackage /usr/lib/jvm/java-openjdk/bin
COPY jps /usr/lib/jvm/java-openjdk/bin
COPY jrunscript /usr/lib/jvm/java-openjdk/bin
COPY jshell /usr/lib/jvm/java-openjdk/bin
COPY jstack /usr/lib/jvm/java-openjdk/bin
COPY jstat /usr/lib/jvm/java-openjdk/bin
COPY jstatd /usr/lib/jvm/java-openjdk/bin
COPY jwebserver /usr/lib/jvm/java-openjdk/bin
COPY keytool /usr/lib/jvm/java-openjdk/bin
COPY rmiregistry /usr/lib/jvm/java-openjdk/bin
COPY serialver /usr/lib/jvm/java-openjdk/bin

EXPOSE 8998 1099

VOLUME /var/imq
VOLUME /opt/imq.tar/imq/etc

ENTRYPOINT ["/opt/imq.tar/imq/bin/imqbrokerd", "-vmargs", "-d64", "-port", "8998", "/opt/java/bin/java"]
