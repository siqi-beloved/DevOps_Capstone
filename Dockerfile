<<<<<<< Updated upstream
FROM nginx:alpine
#:1.17-alpine

#RUN rm /etc/nginx/conf.d/default.conf

#RUN rm /etc/nginx/conf.d/examplessl.conf

COPY capstone /usr/share/nginx/html

#COPY conf /etc/nginx
=======
FROM nginx

COPY capstone /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
>>>>>>> Stashed changes
