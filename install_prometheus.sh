#! /bin/bash
sudo apt-get update

# Install Prometheus Server
wget https://github.com/prometheus/prometheus/releases/download/v2.27.0/prometheus-2.27.0.linux-amd64.tar.gz
tar xvfz prometheus-2.27.0.linux-amd64.tar.gz
cd prometheus-2.27.0.linux-amd64/ && ./prometheus --config.file=./prometheus.yml

cd ..

wget https://github.com/prometheus/alertmanager/releases/download/v0.22.0-rc.1/alertmanager-0.22.0-rc.1.linux-amd64.tar.gz
tar xvfz alertmanager-0.22.0-rc.1.linux-amd64.tar.gz
cd alertmanager-0.22.0-rc.1.linux-amd64/ && ./alertmanager

#to reload prometheus after editing config
# sudo killall -HUP prometheus
# Or curl -s -XPOST localhost:9090/-/reload

# Add to prometheus.yml config
#   - job_name: 'node'
#     ec2_sd_configs:
#       - region: eu-central-1                              
#         access_key: AKIAUGJZHZ2BLWTC6MUX
#         secret_key: 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
#         port: 9100