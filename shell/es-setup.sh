#!/usr/bin/env bash

elasticsearch-plugin install ingest-user-agent
yes | elasticsearch-plugin install ingest-geoip

export ES_HOME=/usr/share/elasticsearch
mkdir $ES_HOME/config/ingest-geoip
cd $ES_HOME/config/ingest-geoip
wget http://geolite.maxmind.com/download/geoip/database/GeoLite2-City.tar.gz -O GeoLite2-City.mmdb.gz
wget http://geolite.maxmind.com/download/geoip/database/GeoLite2-Country.tar.gz -O GeoLite2-Country.mmdb.gz
