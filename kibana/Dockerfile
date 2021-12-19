FROM bcsachin/ub-java:3.0

ENV DEBIAN_FRONTEND noninteractive

RUN mkdir /data

RUN apt-get install wget

RUN \
    apt-get update && \
    wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add - && \
    apt-get install apt-transport-https -y&& \
    echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-7.x.list && \
    apt-get update && apt-get install kibana -y 

RUN \
    echo "server.port: 5601" >>/etc/kibana/kibana.yml && \
    echo "server.host: \"0.0.0.0\"" >>/etc/kibana/kibana.yml && \
    echo "elasticsearch.hosts: [\"http://elasticsearch:9200\"]" >>/etc/kibana/kibana.yml 

CMD service kibana start  ; while true ; do sleep 100; done;
EXPOSE 5601
