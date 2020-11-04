FROM python:slim as builder
WORKDIR /tmp
RUN pip install ansi2html
COPY infra.sh .
RUN [ "bash", "-c", "./infra.sh | ansi2html -t Amdocs > amdocs.html"]

FROM nginx:stable
COPY --from=builder /tmp/amdocs.html /var/www/index.html
COPY ./nginx.conf /etc/nginx/conf.d/default.conf