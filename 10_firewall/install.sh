#!/bin/bash

# Ports for Lighthouse
ufw allow 9000

echo "Do you need remote access to this machine? (y/N)"
printf "> "
read remote

if [["${remote}" == "y"]]; then
  # Port for SSH
  ufw allow 22/tcp
fi

ufw enable