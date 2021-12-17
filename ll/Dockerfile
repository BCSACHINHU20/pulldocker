FROM ub-java:3.0

ENV DEBIAN_FRONTEND noninteractive

RUN mkdir /data

RUN apt-get install wget

RUN \
  apt-get update && \
  wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add - && \
  apt-get install apt-transport-https -y && \
  echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-7.x.list && \
  apt-get update && apt-get install logstash -y 
RUN \
  echo "input {" >> /etc/logstash/conf.d/apache-01.conf && \
  echo "  tcp {" >> /etc/logstash/conf.d/apache-01.conf && \
  echo "    port => 5000 " >> /etc/logstash/conf.d/apache-01.conf && \ 
  echo "    }" >> /etc/logstash/conf.d/apache-01.conf && \ 
  echo "  file {" >> /etc/logstash/conf.d/apache-01.conf && \
  echo "    path => \"/test.log\"" >> /etc/logstash/conf.d/apache-01.conf && \
  echo "    start_position => \"beginning\"" >> /etc/logstash/conf.d/apache-01.conf && \
  echo "    }" >> /etc/logstash/conf.d/apache-01.conf && \
  echo "}" >> /etc/logstash/conf.d/apache-01.conf && \
  echo "output {" >> /etc/logstash/conf.d/apache-01.conf && \
  echo "  elasticsearch {" >> /etc/logstash/conf.d/apache-01.conf && \
  echo "    hosts => [\"elasticsearch:9200\"]" >> /etc/logstash/conf.d/apache-01.conf && \
  echo "   }" >> /etc/logstash/conf.d/apache-01.conf && \
  echo " }" >> /etc/logstash/conf.d/apache-01.conf && \
  echo "INFO logstashmonolog">>/test.log && \
  

  echo "input {" >> /test3.conf && \
  echo "  tcp {" >> /test3.conf && \
  echo "    port => 5001 " >> /test3.conf && \
  echo "   }" >> /test3.conf && \
  echo "}" >> /test3.conf && \
  echo "output {" >> /test3.conf && \
  echo "  elasticsearch {" >> /test3.conf && \
  echo "    hosts => [\"elasticsearch:9200\"]" >> /test3.conf && \
  echo "   }" >> /test3.conf && \
  echo " }" >> /test3.conf && \
  
  echo "input {" >> /test4.conf && \
  echo "  beats {" >> /test4.conf && \
  echo "    port => 5002 " >> /test4.conf && \
  echo "   }" >> /test4.conf && \
  echo "}" >> /test4.conf && \
  echo "output {" >> /test4.conf && \
  echo "  elasticsearch {" >> /test4.conf && \
  echo "    hosts => [\"elasticsearch:9200\"]" >> /test4.conf && \
  echo "   }" >> /test4.conf && \
  echo " }" >> /test4.conf

CMD /usr/share/logstash/bin/logstash -f /test3.conf;while true;do sleep 100;done;
EXPOSE 5000 5001 9600 5044

