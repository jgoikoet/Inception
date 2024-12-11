FROM debian:bullseye

RUN apt-get update

RUN apt-get install -y nginx openssl

RUN mkdir /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/nginx/ssl/jgoikoet.key \
	-out /etc/nginx/ssl/jgoikoet.crt \
	-subj "/CN=jgoikoet.42.fr"

COPY ./conf/nginx.conf /etc/nginx/conf.d

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]