FROM ub-java:3.0
FROM log5:fwb

ENV DEBIAN_FRONTEND noninteractive
CMD /usr/share/logstash/bin/logstash -f /test4.conf --path.data /PATH2 ;while true ; do sleep 100; done ;
EXPOSE 5000 5001 9600 5044 5002

