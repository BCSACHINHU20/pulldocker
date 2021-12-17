ARG IMAGE=focal-1.1.0

FROM phusion/baseimage:${IMAGE}
RUN apt-get update
RUN apt-get install -y  
RUN \
  apt-get update && \
  apt-get install openjdk-8-jdk -y

RUN useradd -d /home/esuser -m esuser
WORKDIR /home/esuser
ENV ES_JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64