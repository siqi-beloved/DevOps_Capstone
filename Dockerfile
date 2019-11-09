FROM nginx:1.17-alpine

RUN rm /etc/nginx/conf.d/default.conf

RUN rm /etc/nginx/conf.d/examplessl.conf

COPY capstone /usr/share/nginx/html

COPY conf /etc/nginx
