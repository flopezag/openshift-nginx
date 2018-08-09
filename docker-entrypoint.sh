#!/bin/bash
set -e

# change the wirecloud server by the environment variable
sed -i.bak "s/wirecloud/$WIRECLOUD_SERVER/" /etc/nginx/nginx.conf
