FROM golang:1.8.3

RUN apt-get install git make openssl

RUN git clone https://github.com/tutumcloud/ngrok.git /ngrok

COPY *.sh /

ENV MY_FILES /myfiles
ENV NGROK_DOMAIN **None**
ENV NGROK_TUNNEL_ADDR :4443
ENV NGROK_HTTP_ADDR :80
ENV NGROK_HTTPS_ADDR :443

EXPOSE 4443
EXPOSE 80
EXPOSE 443

CMD ["/run.sh"]
