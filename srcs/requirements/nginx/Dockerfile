FROM debian:buster

RUN apt-get update && apt-get install -y nginx openssl && rm -rf /var/lib/apt/lists/*

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;"]