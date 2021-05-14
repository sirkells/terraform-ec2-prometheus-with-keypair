#! /bin/bash
sudo apt-get update
wget https://github.com/prometheus/prometheus/releases/download/v2.27.0/prometheus-2.27.0.linux-amd64.tar.gz
tar xvfz prometheus-2.27.0.linux-amd64.tar.gz
cd prometheus-2.27.0.linux-amd64/ && ./prometheus --config.file=./prometheus.yml
