FROM nginx:latest

# deploy specific nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# support running as arbitrary user which belogs to the root group
RUN chmod g+rwx /var/cache/nginx /var/run /var/log/nginx  && chmod -R g+w /etc/nginx

# users are not allowed to listen on privileged ports
RUN sed -i.bak 's/listen\(.*\)80;/listen 8081;/' /etc/nginx/nginx.conf

# comment user directive as master process is run as user in OpenShift anyhow
RUN sed -i.bak 's/^user/#user/' /etc/nginx/nginx.conf

RUN sed -i.bak "s/wirecloud/$WIRECLOUD_SERVER/" /etc/nginx/nginx.conf

# assign nginx user to the root group
RUN addgroup nginx root
USER 1001

# output port
EXPOSE 8081

COPY ./docker-entrypoint.sh  /

RUN chmod g+rwx /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
