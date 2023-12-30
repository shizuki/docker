FROM nginx:latest

RUN touch /var/run/nginx.pid \
    && chown -R nginx:nginx /var/cache/nginx \
    && chown -R nginx:nginx /var/run/nginx.pid \
    && chown -R nginx:nginx /var/www
# USER nginx
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
