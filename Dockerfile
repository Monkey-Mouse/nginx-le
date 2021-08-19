FROM nginx:1.19-alpine

ADD conf/nginx.conf /etc/nginx/nginx.conf

ADD script/entrypoint.sh /entrypoint.sh
ADD script/le.sh /le.sh
ADD service.conf /etc/nginx/service.conf

RUN \
 rm /etc/nginx/conf.d/default.conf && \
 chmod +x /entrypoint.sh && \
 chmod +x /le.sh && \
 apk add --no-cache --update certbot tzdata openssl

CMD ["/entrypoint.sh"]
