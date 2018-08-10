#!/usr/bin/env bash

dpkg -i /tmp/shell/filebeat-6.3.2-amd64.deb
filebeat modules enable nginx
sed -ie 's/localhost:9200/elasticsearch:9200/g' /etc/filebeat/filebeat.yml
sed -ie 's/#host: "localhost:5601"/host: "kibana:5601"/g' /etc/filebeat/filebeat.yml
sed -ie 's/#setup.dashboards.enabled: false/setup.dashboards.enabled: true/g' /etc/filebeat/filebeat.yml

rm /var/log/nginx/*.log
nginx -s reload
sed -ie '5i \ \ \ \ var.paths: ["/var/log/nginx/access.log"]' /etc/filebeat/modules.d/nginx.yml
sed -ie '$ a \ \ \ \ var.paths: ["/var/log/nginx/error.log"]' /etc/filebeat/modules.d/nginx.yml

filebeat setup -e
service filebeat restart
