FROM nginx:latest

RUN useradd app \
    && touch /var/run/nginx.pid \
    && chown -R app:app /var/cache/nginx \
    && chown -R app:app /var/run/nginx.pid
USER app
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
