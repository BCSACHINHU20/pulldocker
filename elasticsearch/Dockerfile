FROM bcsachin/ub-java:3.0

ENV DEBIAN_FRONTEND noninteractive

RUN mkdir /data

RUN apt-get install wget

RUN \
    apt-get update && \
    wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add - && \
    apt-get install apt-transport-https -y&& \
    echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-7.x.list && \
    apt-get update && apt-get install elasticsearch -y && \
    echo "-Xms2g">> /etc/elasticsearch/jvm.options && \
    echo "-Xmx2g">> /etc/elasticsearch/jvm.options 

RUN \
    echo "node.name: monolog">> /etc/elasticsearch/elasticsearch.yml && \
    echo "network.host: \"0.0.0.0\"">> /etc/elasticsearch/elasticsearch.yml && \
    echo "http.port: 9200">> /etc/elasticsearch/elasticsearch.yml && \
    echo "cluster.initial_master_nodes: [\"monolog\"]">> /etc/elasticsearch/elasticsearch.yml 


CMD service elasticsearch start  ; while true ; do sleep 100; done;
EXPOSE 9200 9300
