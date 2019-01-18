FROM nginx:alpine

ADD vhost.conf /etc/nginx/conf.d/
RUN chmod 700 /etc/nginx/conf.d/vhost.conf

ARG FRONTEND_HOST_INFO
ENV FRONTEND_HOST_INFO=$FRONTEND_HOST_INFO

RUN sed -i 's/FRONTEND_HOST_INFO/'$FRONTEND_HOST_INFO'/g' /etc/nginx/conf.d/vhost.conf

EXPOSE 80
