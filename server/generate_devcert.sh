#!/bin/bash

# generate self signed certificate for local development

CONFIG="$(cat <<EOF
[dn]
CN=carocloud.com
[req]
distinguished_name = dn
[EXT]
subjectAltName=DNS:lab.carocloud.com
keyUsage=digitalSignature
extendedKeyUsage=serverAuth
EOF
)"

openssl req -x509 -out carocloud.crt -keyout carocloud.key \
  -newkey rsa:2048 -nodes -sha256 \
  -subj '/CN=carocloud.com' -extensions EXT -config <( echo "$CONFIG" )
