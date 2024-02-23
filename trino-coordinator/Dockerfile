#
# This docker image is for launching test purpose trino cluster.
#

# FROM openjdk:21-slim
FROM  amd64/eclipse-temurin:21.0.1_12-jdk
LABEL maintainer=""

# ARG VERSION
ENV TRINO_VERSION=436
ENV TRINO_HOME=/usr/local/trino
ENV BASE_URL=https://repo1.maven.org/maven2

# install dev tools
RUN apt-get update
RUN apt-get install -y \
    curl \
    tar \
    sudo \
    rsync \
    python3 \
    wget \
    python-is-python3 \
    python3-pip \
    python3-dev \
    python3-jinja2 \
    build-essential \
    uuid-runtime \
    less

# RUN pip3 install jinja2

# java
# RUN mkdir -p /usr/java/default && \
#      curl -Ls 'http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz' -H 'Cookie: oraclelicense=accept-securebackup-cookie' | \
#      tar --strip-components=1 -xz -C /usr/java/default/

# ADD jdk-8u112-linux-x64.tar.gz /usr/java
# RUN sudo ln -s /usr/java/jdk1.8.0_112/ /usr/java/default

ENV JAVA_HOME /usr/java/default
ENV PATH $PATH:$JAVA_HOME/bin

# Add trino-cli
WORKDIR /usr/local/bin
RUN wget -q ${BASE_URL}/io/trino/trino-cli/${TRINO_VERSION}/trino-cli-${TRINO_VERSION}-executable.jar
RUN chmod +x trino-cli-${TRINO_VERSION}-executable.jar
RUN mv trino-cli-${TRINO_VERSION}-executable.jar trino-cli

WORKDIR /usr/local
# ADD trino-server-${TRINO_VERSION}.tar.gz /usr/local
RUN wget -q ${BASE_URL}/io/trino/trino-server/${TRINO_VERSION}/trino-server-${TRINO_VERSION}.tar.gz
RUN tar xvzf trino-server-${TRINO_VERSION}.tar.gz -C /usr/local/
RUN ln -s /usr/local/trino-server-${TRINO_VERSION} $TRINO_HOME

ADD ./scripts ${TRINO_HOME}/scripts
ADD ./etc /usr/local/trino/etc

# Create data dir
RUN mkdir -p $TRINO_HOME/data
VOLUME ["$TRINO_HOME/data"]

RUN chmod +x ./trino/scripts/*.sh

EXPOSE 8090

WORKDIR /usr/local/trino
ENTRYPOINT ["./scripts/trino.sh"]


