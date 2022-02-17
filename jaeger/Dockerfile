FROM jaegertracing/all-in-one:latest

EXPOSE 5775 6831 6832 5778 16686 14268 14250

# Set env variable
ENV SPAN_STORAGE_TYPE=elasticsearch
ENV COLLECTOR_ZIPKIN_HOST_PORT=9411
#宿主机es地址
ENV ES_SERVER_URLS=http://10.102.40.30:9200
ENV ES_TAGS_AS_FIELDS_ALL=true
ENV SAMPLING_STRATEGIES_FILE=/etc/jaeger/sampling_strategies.json

ENTRYPOINT ["/go/bin/all-in-one-linux"]