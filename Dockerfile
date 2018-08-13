FROM nginx:latest

MAINTAINER Fernando López <fernando.lopez@fiware.org>

# deploy specific nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# support running as arbitrary user which belogs to the root group
RUN chmod g+rwx /var/cache/nginx /var/run /var/log/nginx  && chmod -R g+w /etc/nginx

# users are not allowed to listen on privileged ports
RUN sed -i.bak 's/listen\(.*\)80;/listen 8080;/' /etc/nginx/nginx.conf

RUN sed -i.bak "s/wirecloud/wirecloud.fiware-certification.svc/" /etc/nginx/nginx.conf

# output port
EXPOSE 8080

# COPY ./docker-entrypoint.sh  /

# RUN chmod g+rwx /docker-entrypoint.sh

# ENTRYPOINT ["/docker-entrypoint.sh"]
