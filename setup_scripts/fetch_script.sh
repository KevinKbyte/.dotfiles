#!/usr/bin/env sh
# https://gist.github.com/steinwaywhw/a4cd19cda655b8249d908261a62687f8

curl -s https://api.github.com/repos/$1/releases/latest \
| grep "browser_download_url.*deb" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -i -
