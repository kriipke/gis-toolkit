#!/bin/bash

# generate self signed certificate for local development

#CERT_DN="carocloud.com"
#CERT_ALTNAME="lab.carocloud.com"

CONFIG="$(cat <<EOF
[dn]
CN=${CERT_DN:-localhost}
[req]
distinguished_name = dn
[EXT]
subjectAltName=DNS:${CERT_ALTNAME:-localhost}
keyUsage=digitalSignature
extendedKeyUsage=serverAuth
EOF
)"

openssl req -x509 -out letsencrypt.crt -keyout letsencrypt.key \
  -newkey rsa:2048 -nodes -sha256 \
  -subj $(printf '/CN=%s' ${CERT_DN:-localhost}) -extensions EXT -config <( echo "$CONFIG" )
