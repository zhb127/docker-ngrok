#!/bin/sh
set -e

if [ "${NGROK_DOMAIN}" == "**None**" ]; then
    echo "Please set NGROK_NGROK_DOMAIN."
    exit 1
fi

if [ ! -f "${MY_FILES}/bin/ngrokd" ]; then
    echo "ngrokd is not build, will be build it now..."
    /bin/sh /build.sh
fi


${MY_FILES}/bin/ngrokd -tlsKey=${MY_FILES}/device.key -tlsCrt=${MY_FILES}/device.crt -domain="${NGROK_DOMAIN}" -httpAddr=${NGROK_HTTP_ADDR} -httpsAddr=${NGROK_HTTPS_ADDR} -tunnelAddr=${NGROK_TUNNEL_ADDR}
