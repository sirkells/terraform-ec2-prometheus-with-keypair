#! /bin/bash
sudo apt-get update
sudo apt install nginx
sudo systemctl start nginx
sudo useradd --no-create-home --shell /bin/false prome
sudo useradd --no-create-home --shell /bin/false node_exporter
sudo mkdir /etc/prometheus
sudo mkdir /var/lib/prometheus
wget https://github.com/prometheus/prometheus/releases/download/v2.27.0/prometheus-2.27.0.darwin-amd64.tar.gz
tar xvf prometheus-2.0.0.linux-amd64.tar.gz
sudo cp prometheus-2.0.0.linux-amd64/prometheus /usr/local/bin/
sudo cp prometheus-2.0.0.linux-amd64/promtool /usr/local/bin/
sudo chown prome:prome /usr/local/bin/prometheus
sudo chown prome:prome /usr/local/bin/promtool
sudo cp -r prometheus-2.0.0.linux-amd64/consoles /etc/prometheus
sudo cp -r prometheus-2.0.0.linux-amd64/console_libraries /etc/prometheus
sudo chown -R prome:prome /etc/prometheus/consoles
sudo chown -R prome:prome /etc/prometheus/console_libraries


sudo systemctl start apache2
sudo systemctl enable apache2
echo "<h1>Deployed via Terraform</h1>" | sudo tee /var/www/html/index.html