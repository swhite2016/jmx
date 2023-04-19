############################################################################
# This dockerfile will setup a centos container with OpenJDK installed on it
############################################################################
FROM node:alpine

MAINTAINER Susie White  <susie.white@salesforce.com>

# source JDK distribution names
# update from https://jdk.java.net/java-se-ri/11
ENV JDK_VERSION="11.0.1"
ENV JDK_URL="https://download.java.net/java/GA/jdk11/13/GPL/openjdk-${JDK_VERSION}_linux-x64_bin.tar.gz"
ENV JDK_HASH="7a6bb980b9c91c478421f865087ad2d69086a0583aeeb9e69204785e8e97dcfd"
ENV JDK_HASH_FILE="${JDK_ARJ_FILE}.sha2"
ENV JDK_ARJ_FILE="openjdk-${JDK_VERSION}.tar.gz"
# target JDK installation names
ENV JAVA_MINIMAL="/usr/lib/jvm"
ENV JAVA_HOME="/usr/lib/jvm/jdk-11.0.1"
ENV PATH="$JAVA_HOME:$PATH"

# downlodad JDK to the local file
ADD "$JDK_URL" "$JDK_ARJ_FILE"

# extract JDK and add to PATH
RUN { \
        echo "Unpack downloaded JDK to ${JAVA_MINIMAL}/:" && \
        mkdir -p "$JAVA_MINIMAL" && \
        tar xf "$JDK_ARJ_FILE" -C "$JAVA_MINIMAL" ; \
    }

#RUN mv /usr/lib/jvm/jdk-11.0.1 /usr/lib/jvm/java-openjdk
ENV PATH="$PATH:$JAVA_HOME/bin"

ADD imq.tar /opt/imq.tar

COPY imqenv.conf /opt/imq.tar/imq/etc

EXPOSE 8998 1099

VOLUME /var/imq
VOLUME /opt/imq.tar/imq/etc

RUN ls -l /usr/lib/jvm/jdk-11.0.1/bin
RUN echo $PATH
RUN /usr/lib/jvm/jdk-11.0.1/bin/java -version

ENTRYPOINT ["/opt/imq.tar/imq/bin/imqbrokerd", "-vmargs", "-d64", "-port", "8998"]
