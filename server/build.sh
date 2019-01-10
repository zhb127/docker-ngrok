#!/bin/sh
set -e

if [ "${NGROK_DOMAIN}" == "**None**" ]; then
    echo "Please set NGROK_DOMAIN."
    exit 1
fi

cd ${MY_FILES}
if [ ! -f "${MY_FILES}/base.pem" ]; then
    openssl genrsa -out base.key 2048
    openssl req -new -x509 -nodes -key base.key -days 10000 -subj "/CN=${NGROK_DOMAIN}" -out base.pem
    openssl genrsa -out device.key 2048
    openssl req -new -key device.key -subj "/CN=${NGROK_DOMAIN}" -out device.csr
    openssl x509 -req -in device.csr -CA base.pem -CAkey base.key -CAcreateserial -days 10000 -out device.crt
fi
cp -r base.pem /ngrok/assets/client/tls/ngrokroot.crt

cd /ngrok
make release-server
GOOS=linux GOARCH=amd64 make release-client

cp -r /ngrok/bin ${MY_FILES}/bin

echo "build done !"
