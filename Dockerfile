FROM nginx:stable

COPY ./amdocs.html /var/www/index.html
COPY ./nginx.conf /etc/nginx/conf.d/default.conf