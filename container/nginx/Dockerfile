FROM nginx:latest

COPY ./app /var/www/app
COPY ./container/nginx/conf.d/app.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
