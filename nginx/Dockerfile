ARG ALPINE_V=3.13

FROM alpine:${ALPINE_V}

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
	&& apk update && apk upgrade && apk --no-cache add tzdata nginx \
	&& cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && apk del tzdata \
	&& mkdir /run/nginx \
	&& mkdir -p /var/log/nginx

EXPOSE 80 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
