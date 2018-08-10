#!/usr/bin/env bash

curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-6.3.2-amd64.deb
mv filebeat-6.3.2-amd64.deb ./shell

docker-compose exec elasticsearch /tmp/shell/es-setup.sh
docker-compose exec web /tmp/shell/filebeat-setup.sh

curl -XDELETE 'http://localhost:9200/filebeat-*'
curl -XGET 'http://localhost:9200/filebeat-*/_search?pretty'
