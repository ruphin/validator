#!/bin/bash
set -e

openssl rand -hex 32 | tr -d "\n" > /var/lib/geth/jwt
chmod 640 /var/lib/geth/jwt
chown geth:geth /var/lib/geth/jwt
